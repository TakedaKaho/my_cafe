class Public::PostsController < ApplicationController
    
    def index
     @posts = Post.includes(:comments).page(params[:page]).per(12) # データベースから投稿を取得（例：コメントも含める）平均評価のため
    end
    
    def show
     @post = Post.find(params[:id])
     @comments = Comment.where(post_id: @post.id)
     #ここでいうwhereはdbのコメントテーブルの中のpost_id: @post.id　postに紐づくコメントアソシエーション関係なく取ってくる
     @average_star = @comments.average(:star).to_f
    end 
    
    def search
    end 
    
    def tag_search
    end 
    
end
