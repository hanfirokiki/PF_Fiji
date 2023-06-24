class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:review_id])
    @comment.destroy
     redirect_to admin_review_path(params[:id]), notice: "コメントが削除されました。"
  end
end
