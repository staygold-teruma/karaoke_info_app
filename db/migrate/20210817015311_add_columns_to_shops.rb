class AddColumnsToShops < ActiveRecord::Migration[6.1]
  def change
    change_table :shops, bulk: true do |t|
      t.string :name, null: false
      t.string :phone_number
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.string :image
    end
  end
end
