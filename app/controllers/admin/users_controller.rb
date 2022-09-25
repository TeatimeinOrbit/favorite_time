class Admin::UsersController < ApplicationController

  def index
    # 通報され後判断待ちのユーザー
    @reported_users = User.where(status: 5)
    # 凍結解除申請者
    @requesting_users = User.where(status: 1)
  end

  def show
    @user = User.find(params[:id])
    @reports = Report.where(reported_id: @user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :header_image, :status)
  end

end
