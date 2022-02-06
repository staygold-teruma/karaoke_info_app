class ShopsController < ApplicationController
  SHOP_PER_PAGE = 10

  def index
    @shop_search = Shop.ransack(params[:q])
    @shops = @shop_search.result.page(params[:page]).per(SHOP_PER_PAGE)
    @count = @shops.count
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
