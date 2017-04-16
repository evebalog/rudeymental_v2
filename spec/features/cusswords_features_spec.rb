require 'rails_helper'

feature "Cusswords" do
  context "when visiting the website" do
    scenario "user is prompted to generate cusswords" do
      visit "/cusswords"
      expect(page).to have_content "How rudey are you feeling today?"
    end
  end
end
