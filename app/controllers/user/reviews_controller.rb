class User::ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all.order(created_at: :desc).page(params[:page])
    @categories = Category.all.order(created_at: :desc)
    #@reviews = Review.all.includes(:user).order(created_at: :desc).page(params[:page])

  end
  def edit
    @review = Review.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    # @reviews = Review.all.order(created_at: :desc).page(params[:page])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review)
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
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

   private

  def review_params
    params.require(:review).permit(:title, :introduction, :category_id, :star, images: [])
  end
end
