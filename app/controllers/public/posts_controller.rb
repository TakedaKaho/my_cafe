class Public::PostsController < ApplicationController
    
    def index
     if params[:latest]
       @posts = Post.latest.includes(:comments).page(params[:page]).per(12)
     elsif params[:old]
       @posts = Post.old.includes(:comments).page(params[:page]).per(12)
     elsif params[:star_count]
       @posts = Post.highest_rated.includes(:comments).page(params[:page]).per(12)
     else
       @posts = Post.includes(:comments).page(params[:page]).per(12)
     end
    end

    
    def show
     @post = Post.find(params[:id])
     @comments = Comment.where(post_id: @post.id)
     #ここでいうwhereはdbのコメントテーブルの中のpost_id: @post.id　postに紐づくコメントアソシエーション関係なく取ってくる
     @average_star = @comments.average(:star).to_f
    end 
    
    def search
     #@post = Post.looks(params[:search], params[:word])
     @posts = Post.looks(params[:word])
    end 
    
    def tag_search
     @tag = Tag.find_by(name: params[:tag])
     #@posts = @tag ? @tag.posts : Post.none　三項演算子のコード
     #下記と同じ。
     if @tag
       @posts = @tag.posts
     else
       @posts = Post.none
     end
    end 
    
end
