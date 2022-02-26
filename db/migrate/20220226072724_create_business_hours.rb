class CreateBusinessHours < ActiveRecord::Migration[6.1]
  def change
    create_table :business_hours do |t|
      t.references :shop, null: false, foreign_key: true
      t.time :weekday_start, null: false
      t.time :weekday_end, null: false
      t.time :fri_start, null: false
      t.time :fri_end, null: false
      t.time :sat_start, null: false
      t.time :sat_end, null: false
      t.time :sun_start, null: false
      t.time :sun_end, null: false
      t.time :before_holiday_start, null: false
      t.time :before_holiday_end, null: false
      t.time :holiday_start, null: false
      t.time :holiday_end, null: false

      t.timestamps
    end
  end
end
