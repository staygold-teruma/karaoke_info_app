class FeeInfosController < ApplicationController
  before_action :set_fee_info, only: %i[show edit update destroy]

  def index
    @fee_infos = FeeInfo.all
  end

  def new
    @fee_info = FeeInfo.new
  end

  def create
    @fee_info = FeeInfo.new(fee_info_params)
    @fee_info.set_values
    if @fee_info.save!
      redirect_to edit_fee_info_url(@fee_info)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @fee_info.set_values
    @fee_info.update!(fee_info_update_params)
    redirect_to edit_fee_info_url(@fee_info)
  end

  def destroy
    @fee_info.destroy!
    redirect_to fee_infos_path
  end

  private

  def fee_info_params
    params.require(:fee_info).permit(:div_member, :number_of_adults, :number_of_students, :number_of_seniors, :number_of_children, :usage_time, :drink_plan)
  end

  def fee_info_update_params
    params.require(:fee_info).permit(:div_member, :number_of_adults, :number_of_students, :number_of_seniors, :number_of_children, :usage_time, :drink_plan,
                                     :number_of_customers, :total_fee, :adult_main_fee, :student_main_fee, :senior_main_fee, :child_main_fee, :adult_drink_fee, :student_drink_fee, :senior_drink_fee, :child_drink_fee, :adult_total_fee, :student_total_fee, :senior_total_fee, :child_total_fee)
  end

  def set_fee_info
    @fee_info = FeeInfo.find(params[:id])
  end
end
