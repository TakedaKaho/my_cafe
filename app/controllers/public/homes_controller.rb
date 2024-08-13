class Public::HomesController < ApplicationController
    def top
      @posts = Post.order(created_at: :desc).limit(5)
      @random_comments = Comment.random_comments.limit(6)
    end
    
    def terms
    end 
    
    def privacy
    end 
end
