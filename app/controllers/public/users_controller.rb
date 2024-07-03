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
       redirect_to @user, notice: "Profile image updated successfully."
      else
       render :edit
      end
    end 
    
    def check
    end 
    
    def out
    end 
    
  private

    def user_params
     params.require(:user).permit(:profile_image)
    end
    
end
