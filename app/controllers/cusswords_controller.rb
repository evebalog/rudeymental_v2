class CusswordsController < ApplicationController

  def index
    @cusses = Cussword.where("rating = ?", params[:severity])
    @display_cusses = @cusses.sample(2)
  end
end
