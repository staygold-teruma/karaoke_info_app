class CreateMainPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :main_plans do |t|
      t.string :name, null: false
      t.text :note
      t.integer :div_member, null: false, default: 0
      t.integer :div_day, null: false, default: 0
      t.integer :div_time, null: false, default: 0
      t.integer :time_unit, null: false, default: 0
      t.integer :adult_fee, null: false
      t.integer :student_fee, null: false
      t.integer :senior_fee, null: false
      t.integer :child_fee, null: false

      t.timestamps
    end
  end
end
