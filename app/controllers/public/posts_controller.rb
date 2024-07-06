class Public::PostsController < ApplicationController
    
    def index
     @posts = Post.all
    end
    
    def show
     @post = Post.find(params[:id])
     @comments = Comment.where(post_id: @post.id)
     #ここでいうwhereはdbのコメントテーブルの中のpost_id: @post.id　postに紐づくコメントアソシエーション関係なく取ってくる
    end 
    
    def search
    end 
    
    def tag_search
    end 
    
end
