class Public::FavoritesController < ApplicationController

  def create
    @posted_content = PostedContent.find(params[:posted_content_id])
    favorite = current_user.favorites.new(posted_content_id: @posted_content.id)
    favorite.save!
  end

  def destroy
    @posted_content = PostedContent.find(params[:posted_content_id])
    favorite = current_user.favorites.find_by(posted_content_id: @posted_content.id)
    favorite.destroy
  end

end
