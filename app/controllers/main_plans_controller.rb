class MainPlansController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @main_plans = MainPlan.all
  end

  def new
    @main_plan = MainPlan.new
  end

  def create
    MainPlan.create!(main_plan_params)
    redirect_to main_plans_path
  end

  def show; end

  def edit; end

  def destroy; end

  private

  def main_plan_params
    params.require(:main_plan).permit(:name, :note, :div_member, :div_day, :div_time, :time_unit, :adult_fee,
                                      :student_fee, :senior_fee, :child_fee)
  end
end
