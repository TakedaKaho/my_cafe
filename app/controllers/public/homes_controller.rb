class Public::HomesController < ApplicationController
    def top
      @posts = Post.order(update_at: :desc).limit(5)
    end
    
    def about
    end 
end
