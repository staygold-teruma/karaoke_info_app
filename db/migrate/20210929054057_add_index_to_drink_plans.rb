class AddIndexToDrinkPlans < ActiveRecord::Migration[6.1]
  def change
    add_index :drink_plans, [:fee_type, :div_time, :base_time, :shop_id], unique: true, name: "drink_plans_unique_index"
  end
end
