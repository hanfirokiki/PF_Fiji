class User::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all.order(created_at: :desc)
   # @images = Review_images.all
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      redirect_to review_path(review)
    else
      render :edit
    end
  end

  def destroy
    review = review.find(params[:id])
    review.destroy
    redirect_to review_path
  end

   private

  def review_params
    params.require(:review).permit(:title, :introduction, :category_id, images: [])
  end
end
