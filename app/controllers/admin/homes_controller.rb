class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
    
    def top
     @total_users = User.count
     @total_comments = Comment.count
     @recent_users = User.order(created_at: :desc).limit(5)
    end 
end
