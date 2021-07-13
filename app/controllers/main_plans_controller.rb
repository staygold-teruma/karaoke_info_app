class MainPlansController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @q = MainPlan.ransack(params[:q])
    @main_plans = @q.result(distinct: true).order(id: 'ASC')
  end

  def new
    @main_plan = MainPlan.new
  end

  def create
    MainPlan.create!(main_plan_params)
    redirect_to main_plans_path
  end

  def show
    @main_plan = MainPlan.find(params[:id])
  end

  def edit
    @main_plan = MainPlan.find(params[:id])
  end

  def update
    @main_plan = MainPlan.find(params[:id])
    @main_plan.update(main_plan_params)
    redirect_to @main_plan
  end

  def destroy
    main_plan = MainPlan.find(params[:id])
    main_plan.destroy!
    redirect_to main_plans_path
  end

  private

  def main_plan_params
    params.require(:main_plan).permit(:name, :note, :div_member, :div_day, :div_time, :time_unit, :adult_fee,
                                      :student_fee, :senior_fee, :child_fee)
  end
end
