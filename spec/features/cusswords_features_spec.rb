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
      # test below was only used before introducing filters
      # scenario "user can see cusswords" do
      #   visit "/cusswords"
      #   expect(page).to have_content "Duckmaster"
      #   expect(page).to have_content "Shitmaster"
      # end
      scenario "user can click on 'PG 13' button and see cusswords with 1 rating only" do
        visit "/cusswords"
        click_button "PG 13"
        expect(page).to have_content "Duckmaster"
        expect(page).to have_no_content "Shitmaster"
      end

      scenario "user can click on 'Mildly Irritated' button and see cusswords with 2 rating only" do
        visit "/cusswords"
        click_button "Mildly Irritated"
        expect(page).to have_content "Shitmaster"
        expect(page).to have_no_content "Duckmaster"
      end
    end
  end
end
