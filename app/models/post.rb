class Post < ApplicationRecord
  validates :title, length: { in: 1..100 }
  validates :body, length: { in: 1..1000 }
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  def liked_by?(user)
    self.likes.exists?(user_id: user.id)
  end
end
