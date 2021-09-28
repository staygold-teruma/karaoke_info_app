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
    @drink_plan = current_shop.drink_plans.new(drink_plan_params)
    if DrinkPlan.exists?(shop_id: @drink_plan.shop_id, base_time: @drink_plan.base_time, fee_type: @drink_plan.fee_type)
      flash.now[:alert] = "その料金はすでに登録されています。"
      render :new
    else
      @drink_plan.save
      redirect_to drink_plans_path, notice: "登録しました"
    end
  end

  def show; end

  def edit; end

  def update
    if DrinkPlan.exists?(shop_id: @drink_plan.shop_id, base_time: @drink_plan.base_time, fee_type: @drink_plan.fee_type)
      flash.now[:alert] = "その料金はすでに登録されています。"
      render :edit
    else
      @drink_plan.update
      redirect_to drink_plans_path, notice: "更新しました"
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
    params.require(:drink_plan).permit(:fee_type, :base_time, :note, :adult_fee, :student_fee, :senior_fee, :child_fee, :extension_adult_fee,
                                       :extension_student_fee, :extension_senior_fee, :extension_child_fee)
  end
end
