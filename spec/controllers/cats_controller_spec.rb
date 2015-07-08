require 'rails_helper'

RSpec.describe CatsController do
  describe "#index" do
    let!(:cat) { create(:cat) }

    before do
      get :index
    end

    it "should assign @cats to all cats" do
      expect(assigns(:cats)).to eq(Cat.all)
    end

    it "should return http status 200" do
      expect(response).to have_http_status(200)
    end

    it "should render the index page" do
      expect(response).to render_template(:index)
    end
  end
end