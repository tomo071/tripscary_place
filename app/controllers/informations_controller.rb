class InformationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @map=Information.new
  end

  def create
    @map=Information.new(info_params)
    @map.user_id=current_user.id
    if @map.save
      flash[:notice] ="投稿しました"
      redirect_to information_path(@map.id)
    else
      render :new
    end
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

  def destroy
    @map=Information.find(params[:id])
    @map.user_id=current_user.id
    @map.delete
    flash[:notice] ="削除しました"
    redirect_to my_page_path
  end

  def update
    @map=Information.find(params[:id])
    @map.user_id=current_user.id
    if @map.update(info_params)
      redirect_to information_path(@map.id)
      flash[:notice] ="上書きしました"
    else
      render :edit
    end
  end

  private

  def info_params
    params.require(:information).permit(:title, :body, :latitude, :longitude, :address)
  end


end
