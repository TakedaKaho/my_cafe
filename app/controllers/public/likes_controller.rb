class Public::LikesController < ApplicationController
 
 
    def create
     @post = Post.find(params[:post_id])
     @like = current_user.likes.new(post: @post)
     #@like = current_user.likes.new(post_id: @post.id)
     @like.save
     #redirect_to post_path(@post) 非同期化のため
    end 
    
    def index #自分がいいねした投稿
     @user = User.find(params[:id])
     #@liked_posts = @post.likes.map(&:post) 効率のため下記に変更
     @liked_posts = Post.joins(:likes).where(likes: { user_id: @user.id }).page(params[:page]).per(18)
    end
    
    def show #このカフェをいいねした人一覧
     @post = Post.find(params[:post_id])
     #@liked_users = @post.likes.map(&:user)　効率のため下記に変更
     @liked_users = User.joins(:likes).where(likes: { post_id: @post.id })
    end
    
    def destroy
     @post = Post.find(params[:post_id])
     @like = current_user.likes.find_by(post_id: @post.id)
     @like.destroy
     #redirect_to post_path(@post)非同期化のため
    end 
    
end
