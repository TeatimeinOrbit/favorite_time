class Public::UserInterestsController < ApplicationController

  def index
  end

  def create
    categories = Category.all
    categories.each do |category|
      @user_interest = UserInterest.new(user_interest_params)
      @user_interest.user_id = current_user.id
      @user_interest.interest_degree = 1.0
    end
    redirect_to edit_public_user_path(current_user.id)
  end

  def update
  end


  private

  def user_interest_params
     params.require(:user_interest).permit(:user_id, :category_id, :interest_degree)
  end

end
