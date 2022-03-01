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
  TIME_TABLE = [["8", 8], ["9", 9], ["10", 10], ["11", 11], ["12", 12], ["13", 13], ["14", 14], ["15", 15], ["16", 16], ["17", 17], ["18", 18], ["19", 19], ["20", 20],
                ["21", 21], ["22", 22], ["23", 23], ["00", 24], ["01", 25], ["02", 26], ["03", 27]]

  def search_time_table(wday)
    start_time = if wday == 0
                   sun_start.hour
                 elsif wday == 5
                   fri_start.hour
                 elsif wday == 6
                   sat_start.hour
                 else
                   weekday_start.hour
                 end
    count = start_time - (DEFAULT_OPEN_TIME - 1)
    if count > 0
      TIME_TABLE.slice(count..20)
    else
      TIME_TABLE
    end
  end
end
