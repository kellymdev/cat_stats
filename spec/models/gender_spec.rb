require 'rails_helper'

RSpec.describe Gender, type: :model do
  let!(:gender) { create(:gender) }

  it "should have a gender" do
    should validate_presence_of(:gender)
  end

  # Delete records created by tests as the Capybara javascript tests require transactional_fixtures to be turned off
  after { Gender.destroy_all }
end
