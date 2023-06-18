class Admin::ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    def destroy
    @review = Review.find(params[:id])
    @review.destroy
      redirect_to root_path, notice: "レビューが削除されました。"
    end
  end
end
