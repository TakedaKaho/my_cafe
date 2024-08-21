class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :authorize_user]
  before_action :authorize_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @liked_posts = @user.likes.map(&:post)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:edit_notice] = "プロフィールが正常に変更されました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def check
  end

  def out
    @user = User.find(current_user.id)
    # デフォルトは false
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_to root_path unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:profile_image, :name, :body, :email)
  end
end

