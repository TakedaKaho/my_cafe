class Admin::PostsController < ApplicationController
    
    def new
     @post = Post.new
    end 
    
    def create
      @post = Post.new(post_params.except(:tag_ids))
     if @post.save
      redirect_to admin_posts_path, notice: 'カフェが投稿されました。'
     else
      render :new
     end
    end
    
    def index
     @posts = Post.all
    end 
    
    def show
     @post = Post.find(params[:id])
    end 
    
    def edit
    end 
    
    def update
    end 
    
    def destroy
    end 
    
  def post_params
    params.require(:post).permit(:name, :address, :hours, :days_open, :review, { tag_ids: [] }, post_images: [])
  end
  
  
end
