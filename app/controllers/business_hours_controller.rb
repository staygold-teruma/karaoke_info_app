class BusinessHoursController < ApplicationController
  before_action :set_business_hour, only: %i[edit update]
  before_action :authenticate_shop!, except: :business_hour_change

  def index
    @business_hour = BusinessHour.includes(:shop).find_by(shop_id: current_shop.id)
  end

  def new
    @business_hour = BusinessHour.new
  end

  def create
    @business_hour = current_shop.business_hours.new(business_hour_params)
    if @business_hour.save
      redirect_to business_hours_path, notice: "営業時間を登録しました"
    else
      flash.now[:alert] = "営業時間を登録できませんでした"
      render :new
    end
  end

  def edit; end

  def update
    if @business_hour.update(business_hour_params)
      redirect_to business_hours_path, notice: "営業時間を更新しました"
    else
      flash.now[:alert] = "営業時間を更新できませんでした"
      render :edit
    end
  end

  def business_hour_change
    @selected_shop = Shop.find(params[:id])
    @business_hour = BusinessHour.includes(:shop).find_by(shop_id: @selected_shop.id)
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
