class FavoritesController < ApplicationController

  def create
    comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.new(comment_id: comment.id)
    favorite.save
    #redirect_to _path(comment)
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.new(comment_id: comment.id)
    favorite.destroy
    #redirect_to _path(comment)
  end

end
