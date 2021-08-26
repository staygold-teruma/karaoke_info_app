class AddShopIdToInformations < ActiveRecord::Migration[6.1]
  def change
    add_reference :informations, :shop, foreign_key: true
  end
end
