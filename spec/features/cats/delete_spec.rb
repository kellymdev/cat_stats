require 'rails_helper'

RSpec.describe "Deleting a cat", :js => true do
  # let(:cat_to_delete) { build(:registered_cat) }
  # let(:cat2) { build(:deceased_cat) }

  before do
    @coat_colour_params = attributes_for(:coat_colour)
    @coat_colour = CoatColour.create! @coat_colour_params
    @breed_params = attributes_for(:breed)
    @breed = Breed.create! @breed_params
    @valid_cat_params = attributes_for(:registered_cat, breed_id: @breed.id, coat_colour_id: @coat_colour.id)
    @cat = Cat.create! @valid_cat_params
    # @valid_cat_params = attributes_for(:registered_cat)
        # post :create, { cat: @valid_cat_params }
        # @cat = Cat.create(@valid_cat_params)
    # @cat = Cat.create(cat_to_delete.attributes)
    # @second_cat = Cat.create(cat2.attributes)
    p @cat
    # page.accept_alert
    # page.accept_modal
    # page.accept_modal(alert)
    # a = page.driver.browser.switch_to.alert
  end

  it "deletes the selected cat" do
    visit "/cats"
    click_link @cat.pet_name
    accept_prompt(with: "Are you sure?") do
      click_link "Delete Cat"
    end
    # expect(a.text).to eq("Are you sure?")
    # a.accept
    expect(page).to_not have_content(@cat.pet_name)
  end

  it "displays the list of cats on successful delete" do
    expect(page).to have_content("Cats")
  end

  after do
    Cat.destroy_all
  end
end