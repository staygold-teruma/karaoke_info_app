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

  DEFAULT_OPEN_TIME = 8

  def remove_count(wday)
    start_time = if wday == 0
                   sun_start.hour
                 elsif wday == 5
                   fri_start.hour
                 elsif wday == 6
                   sat_start.hour
                 else
                   weekday_start.hour
                 end
    start_time - DEFAULT_OPEN_TIME
  end
end
