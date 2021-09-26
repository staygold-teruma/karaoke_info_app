class AddFeeTypeToDrinkPlans < ActiveRecord::Migration[6.1]
  def change
    change_table :drink_plans, bulk: true do |t|
      t.integer :fee_type, null: false, default: 0
    end
  end
end
