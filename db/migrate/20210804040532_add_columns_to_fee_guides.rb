class AddColumnsToFeeGuides < ActiveRecord::Migration[6.1]
  def change
    change_table :fee_guides, bulk: true do |t|
      t.integer :adult_main_fee, null: false
      t.integer :student_main_fee, null: false
      t.integer :senior_main_fee, null: false
      t.integer :child_main_fee, null: false
      t.integer :adult_drink_fee, null: false
      t.integer :student_drink_fee, null: false
      t.integer :senior_drink_fee, null: false
      t.integer :child_drink_fee, null: false
      t.integer :adult_total_fee, null: false
      t.integer :student_total_fee, null: false
      t.integer :senior_total_fee, null: false
      t.integer :child_total_fee, null: false
    end
  end
end
