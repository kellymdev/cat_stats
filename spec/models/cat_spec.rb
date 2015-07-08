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

  describe "#registered?" do
    let!(:registered_cat) { create(:registered_cat) }

    it "returns true if the cat has a registered name and registration number" do
      expect(registered_cat.registered?).to be true
    end

    it "returns false if the cat doesn't have a registered name and registration number" do
      expect(cat.registered?).to be false
    end
  end

  describe "#deceased?" do
    let!(:deceased_cat) { create(:deceased_cat) }

    it "returns true if the cat has a date of death" do
      expect(deceased_cat.deceased?).to be true
    end

    it "returns false if the cat doesn't have a date of death" do
      expect(cat.deceased?).to be false
    end
  end
end
