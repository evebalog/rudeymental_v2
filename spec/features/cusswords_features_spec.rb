require 'rails_helper'

feature "Cusswords page" do
  context "when visiting the website" do
    scenario "user is prompted to generate cusswords" do
      visit "/cusswords"
      expect(page).to have_content "How rudey are you feeling today?"
    end

    context "displaying cusswords" do

      before do
        Cussword.create(word: "Duckmaster", rating: 1)
        Cussword.create(word: "Shitmaster", rating: 2)
      end

      scenario "user can see cusswords" do
        visit "/cusswords"
        expect(page).to have_content "Duckmaster"
        expect(page).to have_content "Shitmaster"
      end
    end
  end
end
