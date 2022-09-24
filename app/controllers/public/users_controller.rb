class Public::UsersController < ApplicationController
  before_action :set_ransack_user, only: [:index, :search]

  def show
    @user = User.find(params[:id])
    @posted_contents = PostedContent.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end
  end

  # "いいね"した投稿一覧表示ページ
  def favorites
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def confirm
  end

  def quit
    @user = User.find(params[:id])
    # statusカラムを退会者にする
    @user.update(status: 4)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def search
    @results = @q_user.result
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :header_image)
  end

  def set_ransack_user
    @q_user = User.ransack(params[:q])
  end


end
