class MainPlansController < ApplicationController
  def index
    @main_plans = MainPlan.all
  end

  def new
    @main_plan = MainPlan.new
  end

  def create; end

  def show; end

  def edit; end

  def destroy; end
end
