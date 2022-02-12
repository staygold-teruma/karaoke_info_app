class FavoriteShopsController < ApplicationController
  def create
    current_user.favorite_shops.create!(shop_id: params[:shop_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.favorite_shops.find_by(shop_id: params[:shop_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
