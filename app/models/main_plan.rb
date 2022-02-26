class MainPlan < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :fee_type, uniqueness: { scope: [:div_day, :div_time, :div_member, :shop_id] }
    validates :div_day
    validates :div_time
    validates :div_member
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 0 } do
      validates :adult_fee
      validates :student_fee
      validates :senior_fee
      validates :child_fee
    end
  end
  validates :note, length: { maximum: 250 }

  enum fee_type: {
    half_hour: 0,
    three_hour: 1,
    free_time: 2
  }
  enum div_day: {
    weekday: 0,
    friday: 1,
    weekend: 2
  }
  enum div_time: {
    day: 0,
    night: 1,
    evening: 2
  }
  enum div_member: {
    other: 0,
    member: 1
  }

  scope :search_main_fee, lambda { |shop, type, day, time, member|
                            find_by(shop_id: shop, fee_type: type, div_day: day, div_time: time, div_member: member)
                          }

  def self.search_fee(type, day, time, member, target)
    applicable_fee = find_by(fee_type: type, div_day: day, div_time: time, div_member: member)
    if applicable_fee.nil?
      "-"
    else
      case target
      when 0
        applicable_fee.adult_fee
      when 1
        applicable_fee.student_fee
      when 2
        applicable_fee.senior_fee
      end
    end
  end
end
