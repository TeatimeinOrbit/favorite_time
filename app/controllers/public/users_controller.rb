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
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end
  end

  # "いいね"した投稿一覧表示ページ
  def favorites
    @favorites = Favorite.where(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :header_image)
  end


end
