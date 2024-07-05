class Public::CommentsController < ApplicationController
    def create
     @comment = Comment.new
     @comment.create
    end 
    
    def index
    end
    
    def destroy
    end
end
