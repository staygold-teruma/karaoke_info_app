class MainPlansController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_main_plan, only: %i[show edit update destroy]
  before_action :authenticate_shop!

  def index
    @main_search = MainPlan.where(shop_id: current_shop.id).includes(:shop).ransack(params[:q])
    @main_plans = @main_search.result(distinct: true).order(id: "ASC")
  end

  def new
    @main_plan = MainPlan.new
  end

  def create
    @main_plan = current_shop.main_plans.new(main_plan_params)
    if @main_plan.save
      redirect_to main_plans_path, notice: "ルーム料金を登録が完了しました"
    else
      flash.now[:alert] = "ルーム料金を登録できませんでした"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @main_plan.update(main_plan_params)
      redirect_to main_plans_path, notice: "ルーム料金を更新しました"
    else
      flash.now[:alert] = "ルーム料金を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @main_plan.destroy!
    redirect_to main_plans_path, notice: "ルーム料金を削除しました"
  end

  private

  def set_main_plan
    @main_plan = current_shop.main_plans.find(params[:id])
  end

  def main_plan_params
    params.require(:main_plan).permit(:fee_type, :note, :div_member, :div_day, :div_time, :time_unit, :adult_fee,
                                      :student_fee, :senior_fee, :child_fee)
  end
end
