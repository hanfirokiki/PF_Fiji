class SearchesController < ApplicationController
  def searches
    @categories = Category.all.order(created_at: :desc)
    @reviews = Review.where(
        'title LIKE ? OR introduction LIKE ?',
        "%#{params[:keyword]}%",
        "%#{params[:keyword]}%"
      )
  end
end
