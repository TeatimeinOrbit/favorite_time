class Public::PostedCommentsController < ApplicationController

  def create
    @posted_content = PostedContent.find(params[:posted_content_id])
    @posted_comment = current_user.posted_comments.new(posted_comment_params)
    @posted_comment.posted_content_id = @posted_content.id
    @posted_comment.save
    @posted_comment = PostedComment.new
  end

  def destroy
    @posted_content = PostedContent.find(params[:posted_content_id])
    @posted_comment = PostedComment.find(params[:id])
    @posted_comment.destroy

  end


  private


  def posted_comment_params
    params.require(:posted_comment).permit(:comment)
  end


end
