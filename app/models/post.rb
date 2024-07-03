class Post < ApplicationRecord
  has_many :cafe_tags
  has_many :posts, through: :cafe_tags
    
  has_many_attached :post_images
    
  validates :name, presence: true
  validates :address, presence: true
  validates :hours, presence: true
  validates :days_open, presence: true
  validates :review, presence: true
end
