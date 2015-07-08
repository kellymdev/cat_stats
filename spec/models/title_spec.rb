require 'rails_helper'

RSpec.describe Title, type: :model do
  let!(:title) { create(:title) }

  it "should have a title" do
    should validate_presence_of(:title)
  end
end
