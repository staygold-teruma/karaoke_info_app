module BusinessHoursHelper
  # 翌◯時の表示
  def next_day_format(time)
    case time.hour
    when 13..23
      strftime("%H:%M")
    when 0..12
      "翌" + time.strftime("%k:%M")
    end
  end
end
