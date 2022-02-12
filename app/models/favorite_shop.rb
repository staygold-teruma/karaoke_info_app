class FavoriteShop < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :shop, dependent: :destroy
  validates :user_id, uniqueness: {
    scope: :shop_id,
    message: "は同じ店舗をお気に入り登録できません"
  }
end
