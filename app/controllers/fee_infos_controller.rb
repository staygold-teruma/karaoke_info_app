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

  def update; end

  def destroy; end

  private

  def fee_info_params
    params.require(:fee_info).permit(:div_member, :number_of_adults, :number_of_students, :number_of_seniors, :number_of_children, :usage_time, :drink_plan)
  end

  def set_fee_info
    @fee_info = FeeInfo.find(params[:id])
  end
end
