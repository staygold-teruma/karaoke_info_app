class Form::FeeGuide < FeeGuide
  include DatetimeIntegratable

  REGISTRABLE_ATTRIBUTES = %i[
    div_member
    usage_time
    drink_plan
    number_of_adults
    number_of_students
    number_of_seniors
    number_of_children
    number_of_customers
    total_fee
    adult_main_fee
    student_main_fee
    senior_main_fee
    child_main_fee
    adult_drink_fee
    student_drink_fee
    senior_drink_fee
    child_drink_fee
    adult_total_fee
    student_total_fee
    senior_total_fee
    child_total_fee
    shop_id
    start_time
  ]

  integrate_datetime_fields :start_time

  validates :start_time_date, presence: true
  validates :start_time_hour, presence: true
  validates :start_time_minute, presence: true
end
