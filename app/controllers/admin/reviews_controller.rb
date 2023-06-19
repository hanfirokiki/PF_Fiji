class Admin::ReviewsController < ApplicationController
   before_action :authenticate_admin!
  def index
    #ページネーション
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page])
    #@commnents = @review.comments
  end

  # def update
  #       @user = User.find(params[:id])
  #   if  @user.update(user_params)
  #       redirect_to admin_user_path
  #   else
  #       render "edit"
  #   end
  # end
  def destroy
    @reviews = Review.find(params[:id])
    @reviews.destroy
    redirect_to request.referer
  end

  def order_index
    @user = User.find(params[:id])
    @review = @user.reviews.page(params[:page])
  end


  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:nickname, :is_deleted)
  end
end
