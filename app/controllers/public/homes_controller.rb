class Public::HomesController < ApplicationController
    def top
      @posts = Post.order(created_at: :desc).limit(5)
      @comments = Comment.recent_comments(6)
    end
    
    def terms
    end 
    
    def privacy
    end 
end
