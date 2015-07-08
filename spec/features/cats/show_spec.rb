require 'rails_helper'

RSpec.describe "Viewing details for a Cat" do
  let!(:cat) { create(:cat) }

  before do
    visit "/cats/#{cat.id}"
  end

  it "displays the pet name for the cat" do
    within('h2') do
      expect(page).to have_content(cat.pet_name)
    end
  end

  it "displays the breed for the cat" do
    expect(page).to have_content(cat.breed.breed_name)
  end

  it "displays the date of birth for the cat" do
    expect(page).to have_content(cat.date_of_birth)
  end

  context "registered cat" do
    let!(:registered_cat) { create(:registered_cat) }

    before do
      visit "/cats/#{registered_cat.id}"
    end

    it "displays the registered name for the cat" do
      expect(page).to have_content(registered_cat.registered_name)
    end

    it "displays the registration number for the cat" do
      expect(page).to have_content(registered_cat.registration_number)
    end
  end

  context "unregistered cat" do
    before do
      visit "/cats/#{cat.id}"
    end

    it "doesn't show the registered name label" do
      expect(page).to_not have_content("Registered Name:")
    end

    it "doesn't show the registration number label" do
      expect(page).to_not have_content("Registration Number:")
    end
  end

  context "deceased cat" do
    let(:deceased_cat) { create(:deceased_cat) }

    before do
      visit "/cats/#{deceased_cat.id}"
    end

    it "displays the date of death for the cat" do
      expect(page).to have_content(deceased_cat.date_of_death)
    end
  end

  context "living cat" do
    before do
      visit "/cats/#{cat.id}"
    end

    it "doesn't show the date of death label" do
      expect(page).to_not have_content("Date of Death:")
    end
  end
end