require 'rails_helper'

RSpec.describe CoatColour, type: :model do
  let!(:coat_colour) { create(:coat_colour) }

  it "should have a colour" do
    should validate_presence_of(:colour)
  end

  after do
    CoatColour.destroy_all
  end
end
