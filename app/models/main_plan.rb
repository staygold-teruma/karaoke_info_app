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
end
