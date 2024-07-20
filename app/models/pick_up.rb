class PickUp < ApplicationRecord
    
 belongs_to :post
    
 has_many_attached :pick_up_images
 
  validates :title, presence: true
  validates :body, presence: true
  validate :exactly_three_images_attached
  #3枚のみ
  def exactly_three_images_attached
    if pick_up_images.length != 3
      errors.add(:pick_up_images, "は3枚添付する必要があります。")
    end
  end
  
end
