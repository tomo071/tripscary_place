class FavoritesController < ApplicationController

  def create
    information = Information.find(params[:information_id])
    favorite = current_user.favorites.new(information_id: information.id)
    favorite.save
    redirect_to information_path(information)
  end

  def destroy
    information = Information.find(params[:information_id])
    favorite = current_user.favorites.find_by(information_id: information.id)
    favorite.destroy
    redirect_to information_path(information)
  end

end
