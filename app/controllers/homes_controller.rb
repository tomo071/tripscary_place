class HomesController < ApplicationController
  def top
    @maps=Information.where("created_at>=?", 1.day.ago)
  end
end
