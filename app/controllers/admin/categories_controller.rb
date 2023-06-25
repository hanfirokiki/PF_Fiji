class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    flash[:notice] = "カテゴリーが新規に追加されました"
    redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if@category.update(category_params)
    flash[:notice] = "編集に成功しました"  
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


