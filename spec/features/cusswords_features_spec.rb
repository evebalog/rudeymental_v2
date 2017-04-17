# require 'rails_helper' - required it in .rspec file instead

feature "Cusswords page" do
  context "when visiting the website" do
    scenario "user is prompted to generate cusswords" do
      visit "/cusswords"
      expect(page).to have_content "How rudey are you feeling today?"
    end
  end
  context "displaying cusswords with rating filters" do

    before {
      Cussword.create(word: "Duckmaster", rating: 1)
      Cussword.create(word: "Shitmaster", rating: 2)
      Cussword.create(word: "Fwordmaster", rating: 3)
    }

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

    scenario "user can click on 'Positively Livid' button and see cusswords with 3 rating only" do
      visit "/cusswords"
      click_button "Positively Livid"
      expect(page).to have_content "Fwordmaster"
      expect(page).to have_no_content "Shitmaster"
      expect(page).to have_no_content "Duckmaster"
    end
  end

  context "displaying translations" do
    let(:cussword_a) { double('cussword', id: 1)}
    let(:cussword_a) { double('cussword', id: 2)}
    before {
      Translation.create(hun_word: "ló", cussword_id: 1)
      Translation.create(hun_word: "fej", cussword_id: 2)
    }
    scenario "user can see translations of the generated cusswords from the database" do
      visit "/cusswords"
      click_button "PG 13"
      expect(page).to have_content "ló fej"
    end
  end
end
