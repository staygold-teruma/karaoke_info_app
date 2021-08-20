class AddColumnsToFeeinfos < ActiveRecord::Migration[6.1]
  def change
    change_table :fee_infos, bulk: true do |t|
      t.integer :adult_main_fee
      t.integer :student_main_fee
      t.integer :senior_main_fee
      t.integer :child_main_fee
      t.integer :adult_drink_fee
      t.integer :student_drink_fee
      t.integer :senior_drink_fee
      t.integer :child_drink_fee
      t.integer :adult_total_fee
      t.integer :student_total_fee
      t.integer :senior_total_fee
      t.integer :child_total_fee
    end
  end
end
