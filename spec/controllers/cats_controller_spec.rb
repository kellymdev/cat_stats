require 'rails_helper'

RSpec.describe CatsController do
  let!(:cat) { create(:cat) }

  describe "GET #index" do
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

  describe "GET #show" do
    before do
      get :show, { :id => cat.to_param }
    end

    it "should assign @cat to the selected cat" do
      expect(assigns(:cat)).to eq(Cat.find(cat.id))
    end

    it "should return http status 200" do
      expect(response).to have_http_status(200)
    end

    it "should render the show page" do
      expect(response).to render_template(:show)
    end
  end
end