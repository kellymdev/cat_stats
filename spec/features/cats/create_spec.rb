require 'rails_helper'

RSpec.describe "Creating a new cat" do
  context "creating an unregistered cat" do
    let!(:valid_cat_params) { create(:cat) }

    before do
      visit '/cats/new'
    end

    it "allows you to enter valid details for an unregistered cat" do
      fill_in "Pet name", with: valid_cat_params.pet_name
      fill_in "Date of birth", with: valid_cat_params.date_of_birth
      click_button "Add Cat"
    end
  end
end