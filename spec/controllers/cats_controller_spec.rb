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

  describe "GET #new" do
    before do
      get :new
    end

    it "should return http status 200" do
      expect(response).to have_http_status(200)
    end

    it "should display a form to create a new cat" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before do
        @valid_cat_params = attributes_for(:registered_cat)
        post :create, { cat: @valid_cat_params }
      end

      it "creates a new cat" do
        expect(Cat.find_by_registration_number(@valid_cat_params[:registration_number])).to be_truthy
      end

      it "redirects to the details page for the newly created cat" do
        cat = Cat.find_by_registration_number(@valid_cat_params[:registration_number])
        expect(response).to redirect_to("/cats/#{cat.id}")
      end
    end
  end

  after do
    Cat.destroy_all
  end
end