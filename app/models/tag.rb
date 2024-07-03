class Tag < ApplicationRecord
  has_many :cafe_tags
  has_many :posts, through: :cafe_tags

  validates :name, presence: true, uniqueness: true
end
