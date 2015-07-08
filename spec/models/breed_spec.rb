require 'rails_helper'

RSpec.describe Breed, type: :model do
  let!(:breed) { create(:breed) }

  it "should have a breed_name" do
    should validate_presence_of(:breed_name)
  end
end
