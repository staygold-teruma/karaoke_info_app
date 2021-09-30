class AddIndexToMainPlans < ActiveRecord::Migration[6.1]
  def change
    add_index :main_plans, [:fee_type, :div_day, :div_time, :div_member, :shop_id], unique: true, name: "main_plans_unique_index"
  end
end
