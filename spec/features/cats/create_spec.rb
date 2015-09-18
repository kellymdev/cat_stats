require 'rails_helper'

RSpec.describe "Creating a new cat" do
  context "creating an unregistered cat" do
    let(:valid_cat_params) { build(:cat) }
    let!(:coat_colour) { create(:coat_colour) }
    let!(:breed) { create(:breed) }
    let!(:gender) { create(:gender) }

    before { visit '/cats/new' }

    it "allows you to enter valid details for an unregistered cat" do
      fill_in "Pet name", with: valid_cat_params.pet_name
      select(gender.gender, from: 'cat_gender_id')
      select('Persian', from: 'cat_breed_id')
      select(coat_colour.colour, from: 'cat_coat_colour_id')
      fill_in "Date of birth", with: valid_cat_params.date_of_birth
      click_button "Create Cat"
      expect(page).to have_content(valid_cat_params.pet_name)
    end
  end

  # Delete records created by tests as the Capybara javascript tests require transactional_fixtures to be turned off
  after do
    Cat.destroy_all
    Breed.destroy_all
    CoatColour.destroy_all
    Gender.destroy_all
  end
end