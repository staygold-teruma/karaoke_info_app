class FeeInfosController < ApplicationController
  def index
    @fee_infos = FeeInfo.all
  end

  def new
    @fee_info = FeeInfo.new
  end

  def create
    @fee_info = FeeInfo.new(fee_info_params)
    @fee_info.set_info
    if @fee_info.save!
      redirect_to fee_infos_path
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
end
