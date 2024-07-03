class Public::UsersController < ApplicationController
    def show
     @user = User.find(params[:id])
    end 
    
    def edit
     @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
       flash[:edit_notice] = "変更内容が正常に保存されました"
       redirect_to @user
      else
       render :edit
      end
    end 
    
    def check
    end 
    
    def out
     @user = User.find(current_user.id)
     #デフォルトはfalse
     @user.update(is_deleted: true)
     reset_session
     redirect_to root_path
    end
    
  private

    def user_params
     params.require(:user).permit(:profile_image, :name, :body)
    end
    
end
