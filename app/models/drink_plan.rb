class DrinkPlan < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true
  validates :note, length: { maximum: 250 }
  validates :time_unit, presence: true
  validates :adult_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :student_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :senior_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :child_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum time_unit: {
    half_hour: 0,
    free_time: 1
  }
end
