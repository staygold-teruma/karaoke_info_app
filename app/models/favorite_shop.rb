class FavoriteShop < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :shop, dependent: :destroy
end
