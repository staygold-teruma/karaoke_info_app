class Users::TopicsController < Users::ApplicationController
  before_action :set_users_topic, only: %i[show]
  PER_PAGE = 3

  def index
    @users_topics = Topic.page(params[:page]).per(PER_PAGE).order(created_at: :desc)
  end

  def show; end

  private

  def set_users_topic
    @users_topic = Topic.find(params[:id])
  end
end
