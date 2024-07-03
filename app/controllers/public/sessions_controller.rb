# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

   def reject_user
    @user = User.find_by(email: params[:user][:email])
    #入力されたuser情報とdb内のuser情報調べて&&(どちらも正しい、つまりある場合は)
    if @user && @user.valid_password?(params[:user][:password])
      #trueかfalseかで処理変えますよー
    if @user.is_deleted
      flash[:out_notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_user_registration_path
    else
      sign_in(@user) # ログイン処理を実行
      redirect_to user_path(current_user)
    end
    #これは&&のelse
  else
    # 該当するユーザが見つからない場合やパスワードが違う場合の処理
    flash[:login_notice] = "メールアドレスまたはパスワードが正しくありません。"
    redirect_to new_user_session_path
  end
 end



  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
