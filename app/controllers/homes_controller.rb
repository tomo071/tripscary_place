class HomesController < ApplicationController
  def top
    
  end

  def guest
    @maps=Information.all
  end
end
