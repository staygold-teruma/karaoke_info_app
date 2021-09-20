class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.date :birthday
      t.integer :sex, default: 0
      t.integer :occupation, default: 0
      t.string :avator
    end
  end
end
