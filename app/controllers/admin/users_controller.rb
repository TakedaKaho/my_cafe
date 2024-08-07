class Admin::UsersController < ApplicationController
 before_action :authenticate_admin!
    
    def index
     @users = User.all.page(params[:page]).per(10)
    end
    
    def show
     @user = User.find(params[:id])
    end 

    def edit
     @user = User.find(params[:id])
    end 
    
    def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:user_notice]="ユーザー情報を更新しました。"
       redirect_to admin_user_path(@user)
     else
       flash[:edit_error_notice] = "プロフィールが正常に変更されました"
       render :edit
     end
    end
    
    def search
     @users = User.looks(params[:word]).order(created_at: :desc)
    end
    
 private
 
    def user_params
      params.require(:user).permit(:name, :profile_image, :body, :is_deleted)
    end
    
end
