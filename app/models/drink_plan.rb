class DrinkPlan < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :name
    validates :time_unit
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 0 } do
      validates :adult_fee
      validates :student_fee
      validates :senior_fee
      validates :child_fee
    end
  end
  validates :note, length: { maximum: 250 }

  enum time_unit: {
    half_hour: 0,
    free_time: 1
  }
end
