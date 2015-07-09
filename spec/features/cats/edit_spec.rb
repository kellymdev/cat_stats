require 'rails_helper'

RSpec.describe "Editing a cat" do
  let!(:cat) { create(:registered_cat) }
  # let!(:coat_colour) { create(:coat_colour) }
  let!(:breed) { create(:breed) }

  before do
    visit "/cats/#{cat.id}"
  end

  it "allows you to update details for a cat" do
    click_link "Edit Cat"
    fill_in "Pet name", with: "Mickey"
    select('Lilac', :from => 'cat_coat_colour_id')
    fill_in 'Date of death', with: '2015-07-09'
    click_button "Update Cat"
    expect(page).to have_content("Cat was successfully updated")
  end

  after do
    Cat.destroy_all
    Breed.destroy_all
    CoatColour.destroy_all
    Gender.destroy_all
  end
end