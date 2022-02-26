class Shop < ApplicationRecord
  has_many :main_plans, dependent: :destroy
  has_many :drink_plans, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :fee_guides, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy
  has_many :business_hours, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  attr_accessor :current_password

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def favorited_by?(user)
    favorite_shops.exists?(user_id: user.id)
  end

  def full_address
    prefecture_name + address_city + address_street
  end
end
