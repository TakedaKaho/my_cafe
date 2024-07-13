class PickUp < ApplicationRecord
    
 belongs_to :post
    
 has_many_attached :pick_up_images
 
  validates :title, presence: true
  validates :body, presence: true
  validate :at_least_one_image
  validate :maximum_three_images
  #複数写真OKにしてるから最低でも1枚はつけてっていう制限.
  #３枚以上は投稿できない制限
  
  def at_least_one_image
    errors.add(:pick_up_images, "must have at least one attached image") unless pick_up_images.attached?
  end
  
  def maximum_three_images
    if pick_up_images.count > 3
      errors.add(:pick_up_images, "can't have more than 3 attached images")
    end
  end
end
