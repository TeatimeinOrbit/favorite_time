class Admin::UsersController < ApplicationController

  def index
    # 通報され後判断待ちのユーザー
    @reported_users = User.where(status: 5)
    @locked_out_users = User.where(status: 2)
  end

  def show
    @reported_user = User.find(params[:id])
    @reports = Report.where(reported_id: @reported_user.id)
  end

  def edit
  end

  def destroy
  end


end
