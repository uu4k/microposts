class Micropost < ActiveRecord::Base
  paginates_per 20
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :favorites
  has_many :favorite_users, class_name: "User", through: :favorites, source: :user 
end
