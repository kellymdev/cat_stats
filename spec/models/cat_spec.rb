require 'rails_helper'

RSpec.describe Cat, type: :model do
  let!(:cat) { create(:cat) }

  it "should have a name" do
    should validate_presence_of(:pet_name)
  end

  it "should have a unique registration number" do
    should validate_uniqueness_of(:registration_number)
  end

  it "should have a date of birth" do
    should validate_presence_of(:date_of_birth)
  end
end
