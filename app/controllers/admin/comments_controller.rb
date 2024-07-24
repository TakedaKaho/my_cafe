class Admin::CommentsController < ApplicationController
 before_action :authenticate_admin!
    
    def index
     @comments = Comment.order(created_at: :desc).page(params[:page]).per(10)
    end 

    def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
     flash[:comment_destroy_notice]="正常にコメントを削除しました"
     redirect_to admin_comments_path
    end 
    
    def search
     @comments = Comment.looks(params[:word]).order(created_at: :desc)
    end 
end
