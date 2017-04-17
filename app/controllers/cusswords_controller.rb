class CusswordsController < ApplicationController
  include CusswordsHelper
  def index
    @cusses = Cussword.where("rating = ?", params[:severity])
    @display_cusses = @cusses.sample(2)
    @hun_words = @display_cusses.map { |cuss| hun_translation(cuss)}
  end
end
