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
    four_hour: 6,
    free_time: 7
  }

  enum drink_plan: {
    one_drink: 0,
    drink_bar: 1,
    lite_plan: 2,
    variety_plan: 3,
    deluxe_plan: 4
  }
end
