class FeeGuidesController < ApplicationController
  before_action :set_fee_guide, only: %i[show destroy]

  def index
    @fee_guides = FeeGuide.includes(:shop)

    @fee_guide_today = @fee_guides.today_data.count
    @member_today = @fee_guides.today_data.customer_breakdown(1)
    @new_member_today = @fee_guides.today_data.customer_breakdown(2)
    @other_today = @fee_guides.today_data.customer_breakdown(0)
    @total_member = @member_today + @new_member_today
    @not_member = @new_member_today + @other_today
    @total_member_ratio_today = @total_member.to_f / @fee_guide_today * 100
    @new_member_ratio_today = @new_member_today.to_f / @not_member * 100

    @fee_guide_month = @fee_guides.month_data.count
    @member_month = @fee_guides.month_data.customer_breakdown(1)
    @new_member_month = @fee_guides.month_data.customer_breakdown(2)
    @other_month = @fee_guides.month_data.customer_breakdown(0)
    @not_member = @new_member_month + @other_month
    @repeat_member_ratio_month = @member_month.to_f / @fee_guide_month * 100
    @new_member_ratio_month = @new_member_month.to_f / @not_member * 100
    @member_ratio_data = [["会員", @member_month], ["新規会員", @new_member_month], ["未入会", @other_month]]

    @total_customers = @fee_guides.sum(:number_of_customers)
    @total_adults = @fee_guides.sum(:number_of_adults)
    @total_students = @fee_guides.sum(:number_of_students)
    @total_seniors = @fee_guides.sum(:number_of_seniors)
    @total_children = @fee_guides.sum(:number_of_children)
    @total_young_people = @total_students + @total_children
    @adults_ratio = @total_adults.to_f / @total_customers * 100
    @students_ratio = @total_students.to_f / @total_customers * 100
    @seniors_ratio = @total_seniors.to_f / @total_customers * 100
    @children_ratio = @total_children.to_f / @total_customers * 100
    @young_ratio = @total_young_people.to_f / @total_customers * 100
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
