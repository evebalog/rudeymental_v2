module CusswordsHelper
  def hun_translation(cuss)
    @hun = Translation.find_by cussword_id: cuss.id
    if @hun.nil?
      "***"
    else
      @hun.hun_word
    end
  end
end
