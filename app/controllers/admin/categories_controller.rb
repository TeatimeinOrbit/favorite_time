class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    category = Category.new(category_params)
    category.save
    redirect_to admin_categories_path
  end

  def edit
    @category = Category.field(params[:id])
  end

  def update
    @category = Category.field(params[:id])
    if @category.update(category_params)
      redirect_to admin_categoies_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end
