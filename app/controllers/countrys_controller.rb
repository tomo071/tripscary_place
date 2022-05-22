class CountrysController < ApplicationController
  def index
    @countrys=Country.all
    @country=Country.new
  end

  def create
    @country=Countri.new
    @country.save(country_params)
  end
  def edit
    @country=Country.find(params[:id])
  end

  def update
    @country=Country.find(params[:id])
    @country.update(country_params)
  end

  private

  def country_params
    params.repuier(:country).permit(:name)
  end
end
