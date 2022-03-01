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

  def set_time_table
    self.weekday_time_table = search_time_table(weekday_start)
    self.fri_time_table = search_time_table(fri_start)
    self.sat_time_table = search_time_table(sat_start)
    self.sun_time_table = search_time_table(sun_start)
    self.before_holiday_time_table = search_time_table(before_holiday_start)
    self.holiday_time_table = search_time_table(holiday_start)
  end

  def search_time_table(wday)
    count = wday.hour - STARTTIME
    if count > 0
      TIMETABLE.shift(count)
    else
      TIMETABLE
    end
  end
end
