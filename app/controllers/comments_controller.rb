class CommentsController < ApplicationController
  def create
    information = Information.find_by(params[:information_id])
    comment = current_user.comments.new(comment_params)
    comment.information_id = information.id
    comment.save
    redirect_to information_path(information)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to information_path(params[:information_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :information_id)
  end
end
