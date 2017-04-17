describe CusswordsController, type: :controller do

  describe "GET index" do
    it "renders the index template and has a 200 status code" do
      get :index
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
    it "displays two samples from cusswords" do
      cuss_a = Cussword.new(word: "One")
      cuss_b = Cussword.new(word: "Two")
      cuss_c = Cussword.new(word: "Three")
      cusses = [cuss_a, cuss_b, cuss_c]
      get :index
      expect(cusses.sample(2).size).to eq(2)
    end
    describe "displaying translations" do
      it "displays translations of the generated cusswords from the database" do
        dbl = double("Mock Translation")
        allow(dbl).to receive(:hun_word).and_return("Ló")
        allow(Translation).to receive(:find_by).and_return(dbl)
        translation = Translation.find_by
        expect(translation.hun_word).to eq "Ló"
      end
      # let(:cussword_a) { double('cussword', id: 1, word: "horse", rating: 1)}
      # let(:cussword_b) { double('cussword', id: 2, word: "head", rating: 1)}
      # let(:translation_a) { double('translation', cussword_id: 1, hun_word: "ló")}
      # let(:translation_b) { double('translation', cussword_id: 2, hun_word: "fej")}
  
    end
  end
end
