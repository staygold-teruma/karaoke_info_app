class FavoriteShopsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    current_user.favorite_shops.create!(shop_id: @shop.id)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    current_user.favorite_shops.find_by(shop_id: @shop.id).destroy!
  end
end
