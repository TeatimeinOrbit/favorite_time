class Public::PostedContentsController < ApplicationController
  before_action :set_ransack, only: [:index, :search]
  before_action :set_ransack_user, only: [:index, :search]

  def new
    @posted_content = PostedContent.new
    @categories = Category.all
    @time_of_days = TimeOfDay.all
  end

  def create
    @posted_content = PostedContent.new(posted_content_params)
    @posted_content.user_id = current_user.id
    if @posted_content.save
      redirect_to public_posted_content_path(@posted_content.id)
    else
      render :new
    end
  end

  def index
    @results = @q.result
    @user_interests = UserInterest.new
  end

  def show
    @posted_content = PostedContent.find(params[:id])
    @posted_comment = PostedComment.new
  end

  def edit
    @posted_content = PostedContent.find(params[:id])
    @categories = Category.all
    @time_of_days = TimeOfDay.all
  end

  def update
    @posted_content = PostedContent.find(params[:id])
    if @posted_content.update(posted_content_params)
      redirect_to public_posted_content_path(@posted_content.id)
    else
      render :edit
    end
  end

  def destroy
    @posted_content = PostedContent.find(params[:id])
    @posted_content.destroy
    redirect_to public_posted_contents_path
  end


  def search
    @results = @q.result
    @results = @q_user.result
    @categories = Category.all
    @time_of_days = TimeOfDay.all
  end


  private


  def posted_content_params
    params.require(:posted_content).permit(:title, :user_id, :sentence, :category_id, :time_of_day_id, :image)
  end


  def set_ransack
    @q = PostedContent.ransack(params[:q])
  end

  def set_ransack_user
    @q_user = User.ransack(params[:q])
  end

end
