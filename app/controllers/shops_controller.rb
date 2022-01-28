class ShopsController < ApplicationController
  SHOP_PER_PAGE = 10

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result.page(params[:page]).per(SHOP_PER_PAGE)
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
