class Shops::TopicsController < Shops::ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]
  before_action :authenticate_shop!, only: %i[new edit update destroy]
  PER_PAGE = 6

  def index
    @shops_topics = Topic.includes(:shop).page(params[:page]).per(PER_PAGE).order(created_at: :desc)
  end

  def new
    @shops_topic = Topic.new
  end

  def create
    @shops_topic = current_shop.shops_topics.new(shops_topic_params)
    unless @shops_topic.image.cached?
      uploader = ImageUploader.new(@shops_topic, "image")
      my_file = open("/Users/staygoldteruma/Desktop/portfolio/karaoke_info_app/app/assets/images/topic.jpg")
      uploader.store!(my_file)
      @topic.image = uploader
    end
    @shops_topic.save
    if @shops_topic.save
      redirect_to shops_topics_path
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
    @shops_topic = if shop_signed_in?
                     current_shop.shops_topics.find(params[:id])
                   else
                     Topic.find(params[:id])
                   end
  end

  def topic_params
    params.require(:shops_topic).permit(:title, :content, :image)
  end
end
