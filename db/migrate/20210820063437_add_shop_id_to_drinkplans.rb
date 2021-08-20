class AddShopIdToDrinkplans < ActiveRecord::Migration[6.1]
  def change
    add_reference :drink_plans, :shop, foreign_key: true
  end
end
