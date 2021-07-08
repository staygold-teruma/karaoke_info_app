class MainPlan < ApplicationRecord
  validates :name, presence: true
  validates :note, length: { maximam: 50 }
  validates :div_member, presence: true
  validates :div_day, presence: true
  validates :div_time, presence: true
  validates :time_unit, presence: true
  validates :adult_fee, presence: true
  validates :student_fee, presence: true
  validates :senior_fee, presence: true
  validates :child_fee, presence: true
end
