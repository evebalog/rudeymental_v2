class CusswordsController < ApplicationController

  def index
    @cusses = Cussword.all
  end
end
