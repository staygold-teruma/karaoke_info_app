class StaticPagesController < ApplicationController
  def home; end

  def coupon; end

  def alcohol_plan; end

  def fee_table
    @main_plans = MainPlan.includes(:shop)
    @drink_plans = DrinkPlan.includes(:shop)
    @shops = Shop.all
  end
end
