class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }

#投稿のお気に入り機能
  has_many :favorites
  has_many :fav_users, through: :favorites, source: :user
end
