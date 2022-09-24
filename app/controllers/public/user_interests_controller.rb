class Public::UserInterestsController < ApplicationController
  
  def index
  end 
  
  def create
    user_interests = UserInterest.new
    user_interests.user_id = current_user.id
    user_interests.interest_degree = 1.0
    user_interests.save
    
    
    
    redirect_to 
  end 
  
  def update
  end 
  
  

end
