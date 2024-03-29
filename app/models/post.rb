class Post < ApplicationRecord
  validates :title, length: { in: 1..50 }
  validates :body, length: { in: 1..1000 }
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  def liked_by?(user)
    self.likes.exists?(user_id: user.id)
  end
end
