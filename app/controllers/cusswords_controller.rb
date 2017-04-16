class CusswordsController < ApplicationController

  def index
    cuss = Cussword.where("rating = ?", params[:severity])
    @cusses = cuss
    
  end
end
