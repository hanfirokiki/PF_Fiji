class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  
  def top
    @categories = Category.all
    @category = Category.new
    
  end

  def about
  end
end
