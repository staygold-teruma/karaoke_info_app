class RemoveTimeUnitFromMainPlans < ActiveRecord::Migration[6.1]
  def up
    change_table :main_plans, bulk: true do |t|
      t.remove :time_unit
    end
  end

  def down
    change_table :main_plans, bulk: true do |t|
      t.integer :time_unit
    end
  end
end
