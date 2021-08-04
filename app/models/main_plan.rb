class MainPlan < ApplicationRecord
  validates :name, presence: true
  validates :note, length: { maximum: 250 }
  validates :div_member, presence: true
  validates :div_day, presence: true
  validates :div_time, presence: true
  validates :time_unit, presence: true
  validates :adult_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :student_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :senior_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :child_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum div_member: {
    other: 0,
    member: 1
  }

  enum div_day: {
    weekday: 0,
    friday: 1,
    weekend: 2
  }

  enum div_time: {
    day: 0,
    night: 1
  }

  enum time_unit: {
    half_hour: 0,
    three_hour: 1,
    four_hour: 2,
    free_time: 3
  }
end
