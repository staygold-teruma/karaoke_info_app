class StaticPagesController < ApplicationController
  def home; end

  def coupon
    @issued_date = Time.current
  end

  def alcohol_plan; end

  def fee_table
    @shops = Shop.all.order(id: "ASC")
    @shop = Shop.first
    @main_plans = MainPlan.includes(:shop).where(shop_id: @shop.id)
  end

  def fee_list_change
    @shop = Shop.find(params[:id])
    @main_plans = MainPlan.includes(:shop).where(shop_id: @shop.id)
  end
end
