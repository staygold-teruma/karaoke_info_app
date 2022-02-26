class BusinessHour < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :weekday_start
    validates :weekday_end
    validates :fri_start
    validates :fri_end
    validates :sat_start
    validates :sat_end
    validates :sun_start
    validates :sun_end
    validates :before_holiday_start
    validates :before_holiday_end
    validates :holiday_start
    validates :holiday_end
  end
end
