class FeeGuidesController < ApplicationController
  before_action :set_fee_guide, only: %i[show edit update destroy]

  def index
    @fee_guides = FeeGuide.all
  end

  def new
    @fee_guide = FeeGuide.new
    @topics_five = Topic.order(created_at: :desc).limit(5)
    @topics_three = Topic.order(created_at: :desc).limit(3)
    @user = current_user
    @shop = current_shop
  end

  def create
    @fee_guide = FeeGuide.new(fee_guide_params)
    @fee_guide.set_calculated_result
    if @fee_guide.save!
      redirect_to edit_fee_guide_url(@fee_guide)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @fee_guide.set_values
    @fee_guide.update!(fee_guide_update_params)
    redirect_to edit_fee_guide_url(@fee_guide)
  end

  def destroy
    @fee_guide.destroy!
    redirect_to fee_guides_path
  end

  private

  def fee_guide_params
    params.require(:fee_guide).permit(:div_member, :number_of_adults, :number_of_students, :number_of_seniors, :number_of_children, :usage_time, :drink_plan)
  end

  def fee_guide_update_params
    params.require(:fee_guide).permit(:div_member, :number_of_adults, :number_of_students, :number_of_seniors, :number_of_children, :usage_time, :drink_plan,
                                      :number_of_customers, :total_fee, :adult_main_fee, :student_main_fee, :senior_main_fee, :child_main_fee, :adult_drink_fee, :student_drink_fee, :senior_drink_fee, :child_drink_fee, :adult_total_fee, :student_total_fee, :senior_total_fee, :child_total_fee)
  end

  def set_fee_guide
    @fee_guide = FeeGuide.find(params[:id])
  end
end
