class MainPlansController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_main_plan, only: %i[show edit update destroy]
  before_action :authenticate_shop!

  def index
    @q = MainPlan.where(shop_id: current_shop.id).includes(:shop).ransack(params[:q])
    @main_plans = @q.result(distinct: true).order(id: "ASC")
  end

  def new
    @main_plan = MainPlan.new
  end

  def create
    @main_plan = current_shop.main_plans.new(main_plan_params)
    if MainPlan.exists?(div_member: @main_plan.div_member, div_day: @main_plan.div_day, div_time: @main_plan.div_time, shop_id: @main_plan.shop_id,
                        fee_type: @main_plan.fee_type)
      flash.now[:alert] = "その料金はすでに登録されています。"
      render :new
    else
      @main_plan.save
      redirect_to main_plans_path, notice: "登録しました"
    end
    # if @main_plan.save
    #   redirect_to @main_plan, notice: "登録しました"
    # else
    #   flash.now[:alert] = "登録できませんでした"
    #   render :new
    # end
  end

  def show; end

  def edit; end

  def update
    if MainPlan.exists?(div_member: @main_plan.div_member, div_day: @main_plan.div_day, div_time: @main_plan.div_time, shop_id: @main_plan.shop_id,
                        fee_type: @main_plan.fee_type)
      flash.now[:alert] = "その料金はすでに登録されています。"
      render :edit
    else
      @main_plan.update
      redirect_to main_plans_path, notice: "更新しました"
    end
  end

  def destroy
    @main_plan.destroy!
    redirect_to main_plans_path, notice: "削除しました"
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
