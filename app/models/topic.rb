class Topic < ApplicationRecord
  belongs_to :shop
  validates :title, presence: true
  validates :content, length: { maximum: 250 }
  mount_uploader :image, ImageUploader
end
