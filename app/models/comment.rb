class Comment < ApplicationRecord
 
 belongs_to :post
 belongs_to :user
 #返信用
 belongs_to :parent, class_name: 'Comment', optional: true
 has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
 has_many :notifications, dependent: :destroy
 
 validates :comment, presence: true
 
 after_create :create_notification_for_reply

  private

  def create_notification_for_reply
    if parent.present? && parent.user != user
      Notification.create(
        user: parent.user,
        comment: self,
        post: post,
        read: false
      )
    end
  end
  
  def self.looks(word)
    where("comment LIKE ?", "%#{word}%")
  end
end
