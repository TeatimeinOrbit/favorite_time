class Admin::UsersController < ApplicationController

  def index
    # 通報され後判断待ちのユーザー
    @reported_users = User.where(status: 5)
    @locked_out_users = User.where(status: 2)
  end

  def show
    @reported_user = User.find(params[:id])
    @reports = @user.posted_contents.reports.all
    @posted_contents = PostedContent
  end

  def edit
  end

  def destroy
  end


end
