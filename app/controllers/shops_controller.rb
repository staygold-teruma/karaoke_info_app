class ShopsController < ApplicationController
  def index
    @shop_search = Shop.includes(:favorite_shops).ransack(params[:q])
    @shops = @shop_search.result
    @count = @shops.count
  end

  def show
    @shop = Shop.find(params[:id])
    @business_hour = BusinessHour.includes(:shop).find_by(shop_id: @shop.id)
  end
end
