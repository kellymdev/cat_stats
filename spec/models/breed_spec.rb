require 'rails_helper'

RSpec.describe Breed, type: :model do
  let!(:breed) { create(:breed) }

  it "should have a breed_name" do
    should validate_presence_of(:breed_name)
  end

  # Delete records created by tests as the Capybara javascript tests require transactional_fixtures to be turned off
  after { Breed.destroy_all }
end
