require 'rails_helper'

RSpec.describe Title, type: :model do
  let!(:title) { create(:title) }

  it "should have a title" do
    should validate_presence_of(:title)
  end

  # Delete records created by tests as the Capybara javascript tests require transactional_fixtures to be turned off
  after { Title.destroy_all }
end
