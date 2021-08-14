class AddColumnsToFeeinfos < ActiveRecord::Migration[6.1]
  def change
    add_column :fee_infos, :adult_main_fee, :integer
    add_column :fee_infos, :student_main_fee, :integer
    add_column :fee_infos, :senior_main_fee, :integer
    add_column :fee_infos, :child_main_fee, :integer
    add_column :fee_infos, :adult_drink_fee, :integer
    add_column :fee_infos, :student_drink_fee, :integer
    add_column :fee_infos, :senior_drink_fee, :integer
    add_column :fee_infos, :child_drink_fee, :integer
    add_column :fee_infos, :adult_total_fee, :integer
    add_column :fee_infos, :student_total_fee, :integer
    add_column :fee_infos, :senior_total_fee, :integer
    add_column :fee_infos, :child_total_fee, :integer
  end
end
