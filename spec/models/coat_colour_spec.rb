require 'rails_helper'

RSpec.describe CoatColour, type: :model do
  let!(:coat_colour) { create(:coat_colour) }

  it "should have a colour" do
    should validate_presence_of(:colour)
  end

  # Delete records created by tests as the Capybara javascript tests require transactional_fixtures to be turned off
  after { CoatColour.destroy_all }
end
