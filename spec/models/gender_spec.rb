require 'rails_helper'

RSpec.describe Gender, type: :model do
  let!(:gender) { create(:gender) }

  it "should have a gender" do
    should validate_presence_of(:gender)
  end
end
