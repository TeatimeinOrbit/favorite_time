class Public::HomesController < ApplicationController


  def top
  end

  def about
  end

  def requesting
    @user = User.find_by(id: current_user.id)
  end

end
