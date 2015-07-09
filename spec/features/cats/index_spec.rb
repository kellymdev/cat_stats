require 'rails_helper'

RSpec.describe "Viewing the list of Cats" do
  let!(:cat) { create(:registered_cat) }

  before do
    visit '/cats'
  end
  it "should have a title of Cats" do
    within('h2') do
      expect(page).to have_content("Cats")
    end
  end

  context "registered cat" do
    it "displays the pet name for the cat" do
      expect(page).to have_content(cat.pet_name)
    end

    it "displays the title for the cat" do
      expect(page).to have_content(cat.title.title)
    end

    it "displays the registered name for the cat" do
      expect(page).to have_content(cat.registered_name)
    end

    it "displays the registration_number for the cat" do
      expect(page).to have_content(cat.registration_number)
    end
  end

  context "unregistered cat" do
    let!(:unregistered_cat) { create(:cat) }

    it "displays the pet name for the cat" do
      expect(page).to have_content(unregistered_cat.pet_name)
    end
  end

  after do
    Cat.destroy_all
  end
end