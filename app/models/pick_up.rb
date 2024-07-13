class PickUp < ApplicationRecord
    
 belongs_to :post
    
 has_many_attached :pick_up_images
 
  validates :title, presence: true
  validates :body, presence: true
  validate :exactly_three_images_attached
  #3枚のみ
  def exactly_three_images_attached
    if pick_up_images.attached? && pick_up_images.length != 3
      errors.add(:pick_up_images, "must have exactly three attached images")
    elsif pick_up_images.length > 3
      errors.add(:pick_up_images, "can't have more than three attached images")
    end
  end
  
end
