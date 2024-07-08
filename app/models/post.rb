class Post < ApplicationRecord
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_many_attached :post_images
    
  validates :name, presence: true
  validates :address, presence: true
  validates :hours, presence: true
  validates :days_open, presence: true
  validates :review, presence: true
  validate :at_least_one_image
  validate :maximum_three_images
  #複数写真OKにしてるから最低でも1枚はつけてっていう制限.
  #３枚以上は投稿できない制限
  
  def at_least_one_image
    errors.add(:post_images, "must have at least one attached image") unless post_images.attached?
  end
  
  def maximum_three_images
    if post_images.count > 3
      errors.add(:post_images, "can't have more than 3 attached images")
    end
  end
  
  #postの平均評価のため
  def average_star
    comments.average(:star).to_f
  end
  #管理者側でコメント件数出すため
  def comments_count
    comments.count
  end
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
end
