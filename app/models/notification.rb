class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :post
  
  scope :unread, -> { where(read: false) }
end
