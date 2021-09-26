class AddColmunsToDrinkPlans < ActiveRecord::Migration[6.1]
  def change
    change_table :drink_plans, bulk: true do |t|
      t.integer :base_time, null: false, default: 0
      t.integer :extension_adult_fee, null: false
      t.integer :extension_student_fee, null: false
      t.integer :extension_senior_fee, null: false
      t.integer :extension_child_fee, null: false
    end
  end
end
