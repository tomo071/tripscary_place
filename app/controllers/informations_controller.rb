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

  def search
  latitude = params[:latitude]
  longitude = params[:longitude]

  @places = Information.all.within(2, origin: [latitude, longitude])
  end

  def index
    @maps=Information.all
    #@center=CurrentLocation.find(params[:id])
  end

  def show
    @map=Information.find(params[:id])
    @comment=Comment.new
    @comments=Comment.all
  end

  def edit
    @map=Information.find(params[:id])
  end

  private

  def info_params
    params.require(:information).permit(:title, :body, :latitude, :longitude, :address)
  end


end
