class StaticPagesController < ApplicationController
  def home; end

  def coupon; end

  def alcohol_plan; end

  def fee_table
    @main_ikuta = MainPlan.includes(:shop).find_by(shop_id: 1)
    @main_ekimae = MainPlan.includes(:shop).find_by(shop_id: 2)
    @drink_ikuta = DrinkPlan.includes(:shop).find_by(shop_id: 1)
    @drink_ekimae = DrinkPlan.includes(:shop).find_by(shop_id: 2)
  end
end
