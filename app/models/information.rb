class Information < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :title
    validates :content
  end
  mount_uploader :image, ImageUploader
end
