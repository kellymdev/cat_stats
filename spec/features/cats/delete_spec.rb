require 'rails_helper'

RSpec.describe "Deleting a cat", :js => true do
  let(:breed) { create(:breed) }
  let(:coat_colour) { create(:coat_colour) }
  let(:gender) { create(:gender) }
  let(:valid_cat_params) { attributes_for(:registered_cat, breed_id: breed.id, coat_colour_id: coat_colour.id, gender_id: gender.id)}

  before do
    @cat = Cat.create! valid_cat_params
    visit "/cats"
    click_link @cat.pet_name
    accept_prompt(with: "Are you sure?") do
      click_link "Delete Cat"
    end
  end

  it "deletes the selected cat" do
    expect(page).to have_content("#{@cat.pet_name} was successfully deleted")
  end

  it "displays the list of cats on successful delete" do
    expect(page).to_not have_content(@cat.registered_name)
  end

  # Delete records created by tests as the Capybara javascript tests require transactional_fixtures to be turned off
  after do
    Cat.destroy_all
    Breed.destroy_all
    CoatColour.destroy_all
    Gender.destroy_all
  end
end