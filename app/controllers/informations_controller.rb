class InformationsController < ApplicationController
  def new
    @map=Information.new
  end

  def create
    @map=Information.new(info_params)
    @map.user_id=current_user.id
    @map.save

    redirect_to information_path(@map.id)
  end

  def current_location
    @maps = Information.all
  end

  def index
    @maps=Information.all

  end

  def show
    @map=Information.find(params[:id])
    @comment=Comment.new
    @comments=@map.comments.order(created_at: :desc)
  end

  def edit
    @map=Information.find(params[:id])
  end

  def update
    @map=Information.find(params[:id])
    @map.user_id=current_user.id
    @map.update(info_params)
    redirect_to information_path(@map.id)
  end

  private

  def info_params
    params.require(:information).permit(:title, :body, :latitude, :longitude, :address)
  end


end
