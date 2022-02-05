class DrinkPlansController < ApplicationController
  before_action :set_drink_plan, only: %i[show edit update destroy]
  before_action :authenticate_shop!

  def index
    @drink_search = DrinkPlan.includes(:shop).ransack(params[:q])
    @drink_plans = @drink_search.result(distinct: true).order(id: "ASC")
  end

  def new
    @drink_plan = DrinkPlan.new
  end

  def create
    @drink_plan = current_shop.drink_plans.new(drink_plan_params)
    if @drink_plan.save
      redirect_to drink_plans_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録できませんでした"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @drink_plan.update(drink_plan_params)
      redirect_to drink_plans_path, notice: "更新しました"
    else
      flash.now[:alert] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    @drink_plan.destroy!
    redirect_to drink_plans_path, notice: "削除しました"
  end

  private

  def set_drink_plan
    @drink_plan = current_shop.drink_plans.find(params[:id])
  end

  def drink_plan_params
    params.require(:drink_plan).permit(:fee_type, :div_time, :base_time, :adult_fee, :student_fee, :senior_fee, :child_fee, :extension_adult_fee,
                                       :extension_student_fee, :extension_senior_fee, :extension_child_fee, :note)
  end
end
