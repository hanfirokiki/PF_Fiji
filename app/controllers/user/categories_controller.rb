class User::CategoriesController < ApplicationController
  def show
    @categories = Category.all.order(created_at: :desc)
    @category = Category.find(params[:id])
  end
end

