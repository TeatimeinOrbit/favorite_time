# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

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

  # ユーザーステータスを判断するメソッド
  def user_state
    ## 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password])
      ## ここから以下ユーザーステータス(1..4)によって振り分ける(0は一般ユーザー)
      case User.statuses[@user.status]
      ### 凍結解除申請書だった場合
      when 1
        flash.now[:notice] = "審議中です。"
        render :new
      ### 凍結されていた場合
      when 2
        flash.now[:notice] = "凍結中。解除申請はこちらから。"
        redirect_to
      ### 永久凍結されていた場合
      when 3
        flash.now[:notice] = "アカウントは永久凍結されました。"
        redirect_to public_about_path
      ### アカウントを削除していた場合
      when 4
        flash[:notice] = "アカウントはありません"
        redirect_to new_user_registration_path
      end
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
