class CreateDrinkPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :drink_plans do |t|
      t.string :name, null: false
      t.text :note
      t.integer :time_unit, null: false, default: 0
      t.integer :adult_fee, null: false
      t.integer :student_fee, null: false
      t.integer :senior_fee, null: false
      t.integer :child_fee, null: false

      t.timestamps
    end
  end
end
