class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]

  def index
    @topics = Topic.includes(:shop).order(:created_at)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_shop.topics.new(topic_params)
    unless @topic.image.cached?
      uploader = ImageUploader.new(@topic, "image")
      my_file = open("/Users/staygoldteruma/Desktop/portfolio/karaoke_info_app/app/assets/images/topic.jpg")
      uploader.store!(my_file)
      @topic.image = uploader
    end
    @topic.save
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
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
