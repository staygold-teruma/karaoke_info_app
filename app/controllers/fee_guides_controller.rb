class FeeGuidesController < ApplicationController
  before_action :set_fee_guide, only: %i[show destroy]
  before_action :authenticate_shop!

  def index
    @fee_guides = FeeGuide.includes(:shop).all
  end

  def new
    @fee_guide = Form::FeeGuide.new
    @topics_five = Topic.order(created_at: :desc).limit(5)
    @topics_three = Topic.order(created_at: :desc).limit(3)
    @user = current_user
    @shop = current_shop
  end

  def create
    @fee_guide = Form::FeeGuide.new(fee_guide_params)
    @fee_guide.store_calculated_result
    if @fee_guide.save!
      redirect_to edit_fee_guide_url(@fee_guide)
    else
      render :new
    end
  end

  def show; end

  def edit
    @fee_guide = Form::FeeGuide.find(params[:id])
  end

  def update
    @fee_guide = Form::FeeGuide.find(params[:id])
    @fee_guide.reset_params(fee_guide_update_params)
    @fee_guide.store_calculated_result
    @fee_guide.save!
    redirect_to edit_fee_guide_url(@fee_guide)
  end

  def destroy
    @fee_guide.destroy!
    redirect_to fee_guides_path
  end

  private

  def fee_guide_params
    params.require(:form_fee_guide).permit(Form::FeeGuide::REGISTRABLE_ATTRIBUTES)
  end

  def fee_guide_update_params
    params.require(:form_fee_guide).permit(Form::FeeGuide::REGISTRABLE_ATTRIBUTES)
  end

  def set_fee_guide
    @fee_guide = current_shop.fee_guides.find(params[:id])
  end
end
