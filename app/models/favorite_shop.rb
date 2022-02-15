class FavoriteShop < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :user_id, uniqueness: {
    scope: :shop_id,
    message: "は同じ店舗をお気に入り登録できません"
  }
end
