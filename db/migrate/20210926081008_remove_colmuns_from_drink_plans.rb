class RemoveColmunsFromDrinkPlans < ActiveRecord::Migration[6.1]
  def up
    change_table :drink_plans, bulk: true do |t|
      t.remove :name
      t.remove :time_unit
    end
  end

  def down
    change_table :drink_plans, bulk: true do |t|
      t.string :name
      t.integer :time_unit
    end
  end
end
