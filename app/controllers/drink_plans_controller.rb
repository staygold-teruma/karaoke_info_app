class DrinkPlansController < ApplicationController
  def index
    @q = DrinkPlan.ransack(params[:q])
    @drink_plans = @q.result(distinct: true).order(id: "ASC")
  end

  def new
    @drink_plan = DrinkPlan.new
  end

  def create
    DrinkPlan.create(drink_plan_params)
    redirect_to drink_plans_path
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_main_plan
    @drink_plan = DrinkPlan.find(params[:id])
  end

  def drink_plan_params
    params.require(:drink_plan).permit(:name, :note, :time_unit, :adult_fee, :student_fee, :senior_fee, :child_fee)
  end
end
