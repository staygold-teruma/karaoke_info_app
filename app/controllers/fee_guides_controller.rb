class FeeGuidesController < ApplicationController
  before_action :set_fee_guide, only: %i[show destroy]

  def index
    @fee_guides = FeeGuide.includes(:shop).where(shop_id: current_shop.id)

    # グラフ・表のデータ
    # 会員データ用
    @not_member_month = @fee_guides.month_data.customer_breakdown(2) + @fee_guides.month_data.customer_breakdown(0)
    @member_ratio_data = [
      ["会員", @fee_guides.month_data.customer_breakdown(1)],
      ["新規会員", @fee_guides.month_data.customer_breakdown(2)],
      ["未入会", @fee_guides.month_data.customer_breakdown(0)]
    ]

    # 客層グラフ用
    @customer_base_data = [
      ["\u4E00\u822C", @fee_guides.sum(:number_of_adults)],
      ["\u5B66\u751F", @fee_guides.sum(:number_of_students)],
      ["\u30B7\u30CB\u30A2", @fee_guides.sum(:number_of_seniors)],
      ["\u5C0F\u5B66\u751F", @fee_guides.sum(:number_of_children)]
    ]
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
