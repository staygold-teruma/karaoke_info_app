require "date"

class FeeInfo < ApplicationRecord
  validates :div_member, presence: true
  validates :number_of_adults, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :number_of_students, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :number_of_seniors, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :number_of_children, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :usage_time, presence: true
  validates :drink_plan, presence: true
  validates :number_of_customers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum div_member: {
    other: 0,
    member: 1
  }

  enum usage_time: {
    half_hour: 0,
    one_hour: 1,
    one_half_hour: 2,
    two_hour: 3,
    two_half_hour: 4,
    three_hour: 5,
    free_time: 6
  }

  enum drink_plan: {
    one_drink: 0,
    drink_bar: 1,
    lite_plan: 2,
    variety_plan: 3,
    deluxe_plan: 4
  }

  HALFHOUR_TO_SECONDS = 30 * 60

  # 曜日区分を取得
  def self.get_day
    today = Date.today
    case today.wday
    when 1..4
      0
    when 0, 6
      2
    when 5
      1
    end
  end

  # 昼料金と夜料金のカウント数を取得
  def self.get_count(count)
    now_time = Time.now
    business_day = case now_time.hour
                   when 0..6
                     now_time.day - 1
                   else
                     now_time.day
                   end
    change_point = Time.local(now_time.year, now_time.month, business_day, 19)
    change_point
    usage_seconds = count * 30 * 60
    end_time = now_time + usage_seconds
    if now_time > change_point
      day_count = 0
      night_count = count
    elsif now_time < change_point && end_time < change_point + (HALFHOUR_TO_SECONDS - 1)
      day_count = count
      night_count = 0
    else
      day_count = (((change_point - 1) - now_time) / HALFHOUR_TO_SECONDS).ceil
      night_count = count - day_count
    end
    [day_count, night_count]
  end

  # ルーム料金を計算
  def self.calculate_main_fee(plan_day, plan_night, number_of_people, unit_count)
    day_adult_fee = plan_day.adult_fee * unit_count[0] * number_of_people[0]
    night_adult_fee = plan_night.adult_fee * unit_count[1] * number_of_people[0]
    total_adult_fee = day_adult_fee + night_adult_fee
    day_student_fee = plan_day.student_fee * unit_count[0] * number_of_people[1]
    night_student_fee = plan_night.student_fee * unit_count[1] * number_of_people[1]
    total_student_fee = day_student_fee + night_student_fee
    day_senior_fee = plan_day.senior_fee * unit_count[0] * number_of_people[2]
    night_senior_fee = plan_night.senior_fee * unit_count[1] * number_of_people[2]
    total_senior_fee = day_senior_fee + night_senior_fee
    day_child_fee = plan_day.child_fee * unit_count[0] * number_of_people[3]
    night_child_fee = plan_night.child_fee * unit_count[1] * number_of_people[3]
    total_child_fee = day_child_fee + night_child_fee
    total_adult_fee + total_student_fee + total_senior_fee + total_child_fee
  end

  # ドリンクコースの種類を取得
  def self.get_drink_plan(plan_n)
    case plan_n
    when "drink_bar"
      "ドリンクバー料金"
    when "lite_plan"
      "ライト飲み放題料金"
    when "variety_plan"
      "バラエティー飲み放題料金"
    when "deluxe_plan"
      "デラックス飲み放題料金"
    end
  end

  # ドリンク料金を計算
  def self.calculate_drink_fee(drink_plan, number_of_people, drink_count)
    adult_drink_fee = drink_plan.adult_fee * number_of_people[0] * drink_count
    student_drink_fee = drink_plan.student_fee * number_of_people[1] * drink_count
    senior_drink_fee = drink_plan.senior_fee * number_of_people[2] * drink_count
    child_drink_fee = drink_plan.child_fee * number_of_people[3] * drink_count
    adult_drink_fee + student_drink_fee + senior_drink_fee + child_drink_fee
  end

  # 合計人数を計算
  def total_customers_value(_params)
    number_of_adults + number_of_students + number_of_seniors + number_of_children
  end

  # 合計金額を計算
  def total_fee_value
    adults_fee_value + students_fee_value + seniors_fee_value + cildren_fee_value
  end
end
