class Shops::TopicsController < Shops::ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]
  before_action :authenticate_shop!
  PER_PAGE = 3

  def index
    @shops_topics = Topic.includes(:shop).where(shop_id: current_shop.id).page(params[:page]).per(PER_PAGE).order(created_at: :desc)
  end

  def new
    @shops_topic = Topic.new
  end

  def create
    @shops_topic = current_shop.topics.new(shops_topic_params)
    unless @shops_topic.image.cached?
      uploader = ImageUploader.new(@shops_topic, "image")
      my_file = open("/Users/staygoldteruma/Desktop/portfolio/karaoke_info_app/app/assets/images/topic.jpg")
      uploader.store!(my_file)
      @shops_topic.image = uploader
    end
    @shops_topic.save
    if @shops_topic.save
      redirect_to shops_topics_path, notice: "トピックスを登録しました"
    else
      render :new, alert: "トピックスを登録できませんでした"
    end
  end

  def show; end

  def edit; end

  def update
    @shops_topic.update!(topic_params)
    redirect_to @shops_topic, notice: "トピックスを更新しました"
  end

  def destroy
    @shops_topic.destroy!
    redirect_to topics_path, notice: "トピックスを削除しました"
  end

  private

  def set_topic
    @shops_topic = current_shop.topics.find(params[:id])
  end

  def shops_topic_params
    params.require(:topic).permit(:title, :content, :image)
  end
end
