class CusswordsController < ApplicationController

  def index
    @cusses = Cussword.where("rating = ?", params[:severity])
  end
end
