class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
     redirect_to root_path, notice: "コメントが削除されました。"
  end
end
