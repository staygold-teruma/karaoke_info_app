class ChangeMainPlansColumns < ActiveRecord::Migration[6.1]
  def up
    change_table :main_plans, bulk: true do |t|
      t.remove :name
      t.integer :fee_type, null: false, default: 0
    end
  end

  def down
    change_table :main_plans, bulk: true do |t|
      t.string :name
      t.remove :fee_type
    end
  end
end
