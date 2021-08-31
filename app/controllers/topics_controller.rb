class TopicsController < ApplicationController
  def index
    @topics = Topic.includes(:shop).order(:created_at)
  end

  def new
    @topic = Topic.new
  end

  def create
    current_shop.topics.create!(topic_params)
    redirect_to topics_path
  end

  def show; end

  def edit; end

  def update
    @topic.update!(topic_params)
    redirect_to @topic
  end

  def destroy
    @topic.destroy!
    redirect_to topics_path
  end

  private

  def set_topic
    @topic = current_shop.topics.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content, :image)
  end
end
