require "date"

class FeeGuide < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :div_member
    validates :usage_time
    validates :drink_plan
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 0 } do
      validates :number_of_adults
      validates :number_of_students
      validates :number_of_seniors
      validates :number_of_children
      validates :number_of_customers
      validates :total_fee
      validates :adult_main_fee
      validates :student_main_fee
      validates :senior_main_fee
      validates :child_main_fee
      validates :adult_drink_fee
      validates :student_drink_fee
      validates :senior_drink_fee
      validates :child_drink_fee
      validates :adult_total_fee
      validates :student_total_fee
      validates :senior_total_fee
      validates :child_total_fee
    end
  end

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

  HALFHOUR_TO_SECONDS = 1800

  # 料金計算して値をセット
  def store_calculated_result
    # 利用時間による料金カウントを取得(@count)
    @count = FeeGuide.usage_times[usage_time] + 1
    @datetime = Time.zone.parse("#{start_time_date} #{start_time_hour}:#{start_time_minute}:00")
    calculate_number_of_customers
    if ["three_hour", "free_time"].include?(usage_time)
      store_main_fee_free_time
      store_drink_fee_free_time
    else
      store_main_fee
      store_drink_fee
    end
    store_each_total_fee
    store_total_fee
  end

  # 更新前にフォームから送信されたデータを再セット
  def reset_params(params)
    self.div_member = params[:div_member]
    self.usage_time = params[:usage_time]
    self.drink_plan = params[:drink_plan]
    self.number_of_adults = params[:number_of_adults]
    self.number_of_students = params[:number_of_students]
    self.number_of_seniors = params[:number_of_seniors]
    self.number_of_children = params[:number_of_children]
  end

  # 合計人数を計算
  def calculate_number_of_customers
    total_customers = number_of_adults + number_of_students + number_of_seniors + number_of_children
    self.number_of_customers = total_customers
  end

  # それぞれのルーム料金を計算
  def store_main_fee
    wday = retrieve_business_wday(@datetime)
    chosen_day_plan = retrieve_day_plan(wday)
    chosen_night_plan = retrieve_night_plan(wday)
    unit_count = retrieve_unit_count(@datetime, @count)
    self.adult_main_fee = calculate_main_fee(chosen_day_plan.adult_fee, chosen_night_plan.adult_fee, unit_count)
    self.student_main_fee = calculate_main_fee(chosen_day_plan.student_fee, chosen_night_plan.student_fee, unit_count)
    self.senior_main_fee = calculate_main_fee(chosen_day_plan.senior_fee, chosen_night_plan.senior_fee, unit_count)
    self.senior_main_fee = adult_main_fee if senior_main_fee > adult_main_fee
    self.child_main_fee = calculate_main_fee(chosen_day_plan.child_fee, chosen_night_plan.child_fee, unit_count)
  end

  # それぞれのフリータイム料金を計算
  def store_main_fee_free_time
    wday = retrieve_business_wday(@datetime)
    if usage_time == "three_hour"
      time = retrieve_div_time_three_hour
      chosen_free_plan = retrieve_three_hour_plan(wday, time)
    else
      time = retrieve_div_time_free_time
      chosen_free_plan = retrieve_free_plan(wday, time)
    end
    self.adult_main_fee = chosen_free_plan.adult_fee
    self.student_main_fee = chosen_free_plan.student_fee
    self.senior_main_fee = chosen_free_plan.senior_fee
    self.senior_main_fee = adult_main_fee if senior_main_fee > adult_main_fee
    self.child_main_fee = chosen_free_plan.child_fee
  end

  # それぞれのドリンク料金を計算(30分単位)
  def store_drink_fee
    case drink_plan
    when "one_drink"
      self.adult_drink_fee = 0
      self.student_drink_fee = 0
      self.senior_drink_fee = 0
      self.child_drink_fee = 0
    when "drink_bar"
      div_db = retrieve_div_time_drink_bar
      chosen_drink_plan = DrinkPlan.find_by(fee_type: drink_plan, div_time: div_db)
      self.adult_drink_fee = chosen_drink_plan.adult_fee
      self.student_drink_fee = chosen_drink_plan.student_fee
      self.senior_drink_fee = chosen_drink_plan.senior_fee
      self.child_drink_fee = chosen_drink_plan.child_fee
    else
      chosen_drink_plan = DrinkPlan.find_by(fee_type: drink_plan)
      maximum_plan = DrinkPlan.find_by(fee_type: drink_plan, base_time: 3)
      self.adult_drink_fee = calculate_drink_fee(chosen_drink_plan.adult_fee, chosen_drink_plan.base_time, chosen_drink_plan.extension_adult_fee,
                                                 maximum_plan.adult_fee, @count)
      self.student_drink_fee = calculate_drink_fee(chosen_drink_plan.student_fee, chosen_drink_plan.base_time, chosen_drink_plan.extension_student_fee,
                                                   maximum_plan.student_fee, @count)
      self.senior_drink_fee = calculate_drink_fee(chosen_drink_plan.senior_fee, chosen_drink_plan.base_time, chosen_drink_plan.extension_senior_fee,
                                                  maximum_plan.senior_fee, @count)
      self.child_drink_fee = calculate_drink_fee(chosen_drink_plan.child_fee, chosen_drink_plan.base_time, chosen_drink_plan.extension_child_fee,
                                                 maximum_plan.child_fee, @count)
    end
  end

  # それぞれのドリンク料金を計算(3時間パック・フリータイム)
  def store_drink_fee_free_time
    chosen_drink_plan = DrinkPlan.find_by(fee_type: drink_plan, base_time: 3)
    self.adult_drink_fee = chosen_drink_plan.adult_fee
    self.student_drink_fee = chosen_drink_plan.student_fee
    self.senior_drink_fee = chosen_drink_plan.senior_fee
    self.child_drink_fee = chosen_drink_plan.child_fee
  end

  # それぞれの1名あたりの料金を計算
  def store_each_total_fee
    self.adult_total_fee = adult_main_fee + adult_drink_fee
    self.student_total_fee = student_main_fee + student_drink_fee
    self.senior_total_fee = senior_main_fee + senior_drink_fee
    self.child_total_fee = child_main_fee + child_drink_fee
  end

  # グループ全体の合計金額を計算
  def store_total_fee
    self.total_fee = (adult_total_fee * number_of_adults) +
                     (student_total_fee * number_of_students) +
                     (senior_total_fee * number_of_seniors) +
                     (child_total_fee * number_of_children)
  end

  # 一般/学生/シニア/小学生ごとの合計料金（ビュー表示用）
  def adult_fee_all
    adult_total_fee * number_of_adults
  end

  def student_fee_all
    student_total_fee * number_of_students
  end

  def senior_fee_all
    senior_total_fee * number_of_seniors
  end

  def child_fee_all
    child_total_fee * number_of_children
  end

  private

  # 曜日区分を取得
  def retrieve_business_wday(datetime)
    wday = datetime.wday
    case datetime.hour
    when 0..6
      wday -= 1
    end
    case wday
    when 1..4
      0
    when 0, 6
      2
    when 5
      1
    end
  end

  # 昼料金と夜料金のカウント数を取得
  def retrieve_unit_count(datetime, count)
    business_day = case datetime.hour
                   when 0..6
                     datetime.day - 1
                   else
                     datetime.day
                   end
    # 料金が切り替わる19時を取得
    change_point = Time.zone.local(datetime.year, datetime.month, business_day, 19)
    usage_seconds = HALFHOUR_TO_SECONDS * count
    end_time = datetime + usage_seconds
    if datetime > change_point
      day_count = 0
      night_count = count
    elsif datetime < change_point && end_time < change_point + (HALFHOUR_TO_SECONDS - 1)
      day_count = count
      night_count = 0
    else
      day_count = (((change_point - 1) - datetime) / HALFHOUR_TO_SECONDS).ceil
      night_count = count - day_count
    end
    [day_count, night_count]
  end

  # フォームで取得した内容から該当の「昼30分料金を取得」
  def retrieve_day_plan(wday)
    MainPlan.find_by(div_member: div_member, div_day: wday, div_time: 0, fee_type: 0)
  end

  # フォームで取得した内容から該当の「夜30分料金を取得」
  def retrieve_night_plan(wday)
    MainPlan.find_by(div_member: div_member, div_day: wday, div_time: 1, fee_type: 0)
  end

  # フォームで取得した内容から該当の「3時間パック料金を取得」
  def retrieve_three_hour_plan(wday, time)
    MainPlan.find_by(div_member: div_member, div_day: wday, div_time: time, fee_type: 1)
  end

  # フォームで取得した内容から該当の「フリータイム料金を取得」
  def retrieve_free_plan(wday, time)
    MainPlan.find_by(div_member: div_member, div_day: wday, div_time: time, fee_type: 2)
  end

  # ルーム料金を計算
  def calculate_main_fee(fee_a, fee_b, count)
    fee_a * count[0] + fee_b * count[1]
  end

  # ドリンク料金を計算
  def calculate_drink_fee(base_fee, base_time, extension_fee, max_fee, count)
    base_time_count = DrinkPlan.base_times[base_time] + 1
    total_alcohol_fee = base_fee + (extension_fee * (count - base_time_count))
    if count <= base_time_count
      base_fee
    elsif max_fee >= total_alcohol_fee
      total_alcohol_fee
    else
      max_fee
    end
  end

  # 3時間パックの適用が昼か夜かを取得
  def retrieve_div_time_three_hour
    now_time = Time.zone.now
    case now_time.hour
    when 6..19
      0
    else
      1
    end
  end

  # フリータイムの適用が昼か夜か夕方かを取得
  def retrieve_div_time_free_time
    now_time = Time.zone.now
    case now_time.hour
    when 6..15
      0
    when 15..19
      2
    else
      1
    end
  end

  # ドリンクバー料金が昼か夜かを取得
  def retrieve_div_time_drink_bar
    now_time = Time.zone.now
    case now_time.hour
    when 6..19
      0
    else
      1
    end
  end
end
