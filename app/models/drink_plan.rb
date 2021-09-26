class DrinkPlan < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :base_time
    validates :fee_type
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
    base_half_hour: 0,
    base_one_hour: 1,
    base_one_half_hour: 2,
    base_free_time: 3
  }
  enum fee_type: {
    drink_bar: 0,
    lite_plan: 1,
    variety_plan: 2,
    deluxe_plan: 3
  }
end
