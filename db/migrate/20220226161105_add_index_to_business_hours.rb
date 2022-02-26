class AddIndexToBusinessHours < ActiveRecord::Migration[6.1]
  def change
    add_index :business_hours,
              [:shop_id, :weekday_start, :weekday_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end, :before_holiday_start, :before_holiday_end, :holiday_start, :holiday_end], unique: true, name: "business_hours_unique_index"
  end
end
