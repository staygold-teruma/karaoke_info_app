class CreateMainPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :main_plans do |t|
      t.integer :fee_type, null: false, default: 0
      t.integer :div_day, null: false, default: 0
      t.integer :div_time, null: false, default: 0
      t.integer :div_member, null: false, default: 0
      t.integer :adult_fee, null: false
      t.integer :student_fee, null: false
      t.integer :senior_fee, null: false
      t.integer :child_fee, null: false
      t.text :note

      t.timestamps
    end
  end
end
