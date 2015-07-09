require 'rails_helper'

RSpec.describe "Deleting a cat", :js => true do
  let(:breed) { build(:breed) }
  let(:coat_colour) { build(:coat_colour) }

  before do
    @breed = Breed.create(breed.attributes)
    @coat_colour = CoatColour.create(coat_colour.attributes)
    @valid_cat_params = attributes_for(:registered_cat, breed_id: @breed.id, coat_colour_id: @coat_colour.id)
    @cat = Cat.create! @valid_cat_params
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

  after do
    Cat.destroy_all
    Breed.destroy_all
    CoatColour.destroy_all
  end
end