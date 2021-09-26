class DrinkPlan < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :name
    validates :time_unit
    validates :base_time
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 0 } do
      validates :adult_fee
      validates :student_fee
      validates :senior_fee
      validates :child_fee
      validates :extension_adult_fee
      validates :extension_student_fee
      validates :extension_senior_fee
      validates :extension_child_fee
    end
  end
  validates :note, length: { maximum: 250 }

  enum time_unit: {
    half_hour: 0,
    free_time: 1
  }
  enum base_time: {
    half_hour: 0,
    one_hour: 1,
    one_half_hour: 2,
    free_time: 3
  }
end
