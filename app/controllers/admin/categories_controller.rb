class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @category = category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if@category.update(category_params)
    redirect_to admin_categories_path
    else
    render 'edit'
    end
    
    
  end

  private

  def category_params
     params.require(:category).permit(:category_name)
  end

end


