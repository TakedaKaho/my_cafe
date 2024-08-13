class Public::HomesController < ApplicationController
    def top
      @posts = Post.order(created_at: :desc).limit(5)
      @high_rating_comments = Comment.high_rating_comments(4, 6)
    end
    
    def terms
    end 
    
    def privacy
    end 
end
