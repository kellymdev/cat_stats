require 'rails_helper'

RSpec.describe "Creating a new cat" do
  context "creating an unregistered cat" do
    let(:valid_cat_params) { build(:cat) }
    let!(:coat_colour) { create(:coat_colour) }
    let!(:breed) { create(:breed) }

    before do
      visit '/cats/new'
    end

    it "allows you to enter valid details for an unregistered cat" do
      fill_in "Pet name", with: valid_cat_params.pet_name
      select('Persian', :from => 'cat_breed_id')
      select('Lilac', :from => 'cat_coat_colour_id')
      fill_in "Date of birth", with: valid_cat_params.date_of_birth
      click_button "Create Cat"
      expect(page).to have_content(valid_cat_params.pet_name)
    end
  end

  after do
    Cat.destroy_all
  end
end