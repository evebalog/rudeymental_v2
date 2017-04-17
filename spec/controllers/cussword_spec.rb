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
  end
end
