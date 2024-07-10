class Public::LikesController < ApplicationController
 
 
    def create
     @post = Post.find(params[:post_id])
     @like = current_user.likes.new(post: @post)
     #@like = current_user.likes.new(post_id: @post.id)
     @like.save
     #redirect_to post_path(@post) 非同期化のため
    end 
    
    def index
     @user = User.find(params[:id])
     @liked_posts = @user.likes.map(&:post)
    end
    
    def show
     @post = Post.find(params[:post_id])
     @liked_users = @post.likes.map(&:user)
    end
    
    def destroy
     @post = Post.find(params[:post_id])
     @like = current_user.likes.find_by(post_id: @post.id)
     @like.destroy
     #redirect_to post_path(@post)非同期化のため
    end 
    
end
