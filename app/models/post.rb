class Post < ApplicationRecord
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  
  has_many :comments, dependent: :destroy
  
  has_many_attached :post_images
    
  validates :name, presence: true
  validates :address, presence: true
  validates :hours, presence: true
  validates :days_open, presence: true
  validates :review, presence: true
  validate :at_least_one_image
  #複数写真OKにしてるから最低でも1枚はつけてっていう制限.
  
  def at_least_one_image
    errors.add(:post_images, "must have at least one attached image") unless post_images.attached?
  end
end
