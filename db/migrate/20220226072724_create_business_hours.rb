class CreateBusinessHours < ActiveRecord::Migration[6.1]
  def change
    create_table :business_hours do |t|
      t.references :shop, null: false, foreign_key: true
      t.time :weekday_start, null: false, default: "2000-01-01 01:00:00"
      t.time :weekday_end, null: false, default: "2000-01-01 20:00:00"
      t.time :fri_start, null: false, default: "2000-01-01 01:00:00"
      t.time :fri_end, null: false, default: "2000-01-01 20:00:00"
      t.time :sat_start, null: false, default: "2000-01-01 01:00:00"
      t.time :sat_end, null: false, default: "2000-01-01 20:00:00"
      t.time :sun_start, null: false, default: "2000-01-01 01:00:00"
      t.time :sun_end, null: false, default: "2000-01-01 20:00:00"
      t.time :before_holiday_start, null: false, default: "2000-01-01 01:00:00"
      t.time :before_holiday_end, null: false, default: "2000-01-01 20:00:00"
      t.time :holiday_start, null: false, default: "2000-01-01 01:00:00"
      t.time :holiday_end, null: false, default: "2000-01-01 20:00:00"

      t.timestamps
    end
  end
end
