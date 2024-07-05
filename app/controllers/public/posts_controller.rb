class Public::PostsController < ApplicationController
    
    def index
     @posts = Post.all
    end
    
    def show
     @post = Post.find(params[:id])
    end 
    
    def search
    end 
    
    def tag_search
    end 
    
end
