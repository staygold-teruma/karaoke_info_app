class InformationsController < ApplicationController
  before_action :set_information, only: %i[show edit update destroy]

  def index
    @informations = Information.include(:shop).order(:created_at)
  end

  def new
    @information = Information.new
  end

  def create
    current_shop.information.create!(information_params)
    redirect_to informations_path
  end

  def show; end

  def edit; end

  def update
    @information.update!(information_params)
    redirect_to @information
  end

  def destroy
    @information.destroy!
    redirect_to informations_path
  end

  private

  def set_information
    @information = current_shop.informations.find(params[:id])
  end

  def information_params
    params.require(:information).permit(:title, :content, :image)
  end
end
