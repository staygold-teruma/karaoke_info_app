class FeeGuidesController < ApplicationController
  before_action :set_fee_guide, only: %i[show destroy]

  def index
    @fee_guides = FeeGuide.includes(:shop).where(shop_id: current_shop.id)

    # 日次データ
    # 総利用数
    @fee_guide_today = @fee_guides.today_data.count
    # 会員利用数
    @member_today = @fee_guides.today_data.customer_breakdown(1)
    # 新規会員利用数
    @new_member_today = @fee_guides.today_data.customer_breakdown(2)
    # 非会員利用数
    @other_today = @fee_guides.today_data.customer_breakdown(0)
    # 会員利用総数
    @total_member = @member_today + @new_member_today
    # 非会員利用総数
    @not_member = @new_member_today + @other_today

    # 月次データ
    @fee_guide_month = @fee_guides.month_data.count
    @member_month = @fee_guides.month_data.customer_breakdown(1)
    @new_member_month = @fee_guides.month_data.customer_breakdown(2)
    @other_month = @fee_guides.month_data.customer_breakdown(0)
    @not_member_month = @new_member_month + @other_month
    @member_ratio_data = [["会員", @member_month], ["新規会員", @new_member_month], ["未入会", @other_month]]

    # 客層データ
    @total_customers = @fee_guides.sum(:number_of_customers)
    @total_adults = @fee_guides.sum(:number_of_adults)
    @total_students = @fee_guides.sum(:number_of_students)
    @total_seniors = @fee_guides.sum(:number_of_seniors)
    @total_children = @fee_guides.sum(:number_of_children)
    @total_young_people = @total_students + @total_children
    @generation_ratio_data = [["\u4E00\u822C", @total_adults], ["\u5B66\u751F", @total_students], ["\u30B7\u30CB\u30A2", @total_seniors],
                              ["\u5C0F\u5B66\u751F", @total_children]]
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
