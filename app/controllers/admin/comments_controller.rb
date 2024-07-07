class Admin::CommentsController < ApplicationController
    
    def index
     @comments = Comment.all.page(params[:page]).per(10)
    end 

    def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
     flash[:comment_destroy_notice]="正常に削除完了しました"
     redirect_to admin_comments_path
    end 
end
