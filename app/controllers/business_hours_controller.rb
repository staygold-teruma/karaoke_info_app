class BusinessHoursController < ApplicationController
  before_action :set_business_hour, only: %i[show edit update]
  before_action :authenticate_shop!

  def new
    @business_hour = BusinessHour.new
  end

  def create
    @business_hour = current_shop.business_hours.new(business_hour_params)
    if @business_hour.save
      redirect_to business_hour_path(@business_hour), notice: "登録しました"
    else
      flash.now[:alert] = "登録できませんでした"
      render :new
    end
  end

  def edit; end

  def update
    if @business_hour.update(business_hour_params)
      redirect_to business_hour_path(@business_hour), notice: "更新しました"
    else
      flash.now[:alert] = "更新できませんでした"
      render :edit
    end
  end

  private

  def set_business_hour
    @business_hour = current_shop.business_hours.find(params[:id])
  end

  def business_hour_params
    params.require(:business_hour).permit(:weekday_start, :weekday_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end,
                                          :before_holiday_start, :before_holiday_end, :holiday_start, :holiday_end)
  end
end
