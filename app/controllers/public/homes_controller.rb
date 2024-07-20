class Public::HomesController < ApplicationController
    def top
      @posts = Post.order(updated_at: :desc).limit(5)
    end
    
    def about
    end 
end
