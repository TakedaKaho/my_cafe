class Admin::PostsController < ApplicationController
    
    def new
     @post = Post.new
    end 
    
    def create
      @post = Post.new(post_params.except(:tag_ids))
     if @post.save
      @post.tag_ids = params[:post][:tag_ids] if params[:post][:tag_ids].present?
      redirect_to admin_post_path(@post.id), notice: 'カフェが投稿されました。'
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
     @post = Post.find(params[:id])
     @post.destroy
     flash[:post_destroy_notice]="正常に削除完了しました"
     redirect_to admin_posts_path
    end 
    
  def post_params
    params.require(:post).permit(:name, :address, :hours, :days_open, :review, post_images: [], tag_ids: [])
  end
  
  
end
