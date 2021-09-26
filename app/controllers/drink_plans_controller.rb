class DrinkPlansController < ApplicationController
  before_action :set_drink_plan, only: %i[show edit update destroy]
  before_action :authenticate_shop!

  def index
    @q = DrinkPlan.includes(:shop).ransack(params[:q])
    @drink_plans = @q.result(distinct: true).order(id: "ASC")
  end

  def new
    @drink_plan = DrinkPlan.new
  end

  def create
    current_shop.drink_plans.create!(drink_plan_params)
    redirect_to drink_plans_path
  end

  def show; end

  def edit; end

  def update
    @drink_plan.update!(drink_plan_params)
    redirect_to drink_plans_path
  end

  def destroy
    @drink_plan.destroy!
    redirect_to drink_plans_path
  end

  private

  def set_drink_plan
    @drink_plan = current_shop.drink_plans.find(params[:id])
  end

  def drink_plan_params
    params.require(:drink_plan).permit(:fee_type, :base_time, :note, :adult_fee, :student_fee, :senior_fee, :child_fee, :extension_adult_fee,
                                       :extension_student_fee, :extension_senior_fee, :extension_child_fee)
  end
end
