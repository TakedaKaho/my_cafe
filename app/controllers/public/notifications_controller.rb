class Public::NotificationsController < ApplicationController
    before_action :authenticate_user!
    
    #未読通知
    def index
      @notifications = current_user.notifications.where(read: false)
    end
    
    #通知を既読にするアクション
    def mark_as_read
      @notification = current_user.notifications.find(params[:id])
      @notification.update(read: true)
      redirect_to post_path(@notification.post)
    end
  
end
