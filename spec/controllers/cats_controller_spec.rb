require 'rails_helper'

RSpec.describe CatsController do
  render_views

  let(:cat) { create(:cat) }
  let(:registered_cat) { create(:registered_cat) }
  let(:valid_cat_params) { attributes_for(:registered_cat) }
  let(:updated_params) { attributes_for(:deceased_cat) }

  describe "GET #index" do
    before { get :index }

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
    before { get :show, params: { id: cat.id } }

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
    before { get :new }

    it "should return http status 200" do
      expect(response).to have_http_status(200)
    end

    it "should display a form to create a new cat" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, params: { cat: valid_cat_params } }

      it "creates a new cat" do
        expect(Cat.find_by_registration_number(valid_cat_params[:registration_number])).to be_truthy
      end

      it "redirects to the details page for the newly created cat" do
        cat = Cat.find_by_registration_number(valid_cat_params[:registration_number])
        expect(response).to redirect_to("/cats/#{cat.id}")
      end
    end

    context "with invalid params" do
      before { post :create, params: { cat: { pet_name: "" } } }

      it "returns http status 400" do
        expect(response).to have_http_status(400)
      end

      it "displays the new cat form" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do

    before { @cat = Cat.create! valid_cat_params }

    it "deletes the selected cat" do
      expect {
        delete :destroy, params: { id: @cat.id }
      }.to change(Cat, :count).by(-1)
    end

    it "redirects to the index page" do
      expect(delete :destroy, params: { id: @cat.id }).to redirect_to(cats_path)
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: registered_cat.id } }

    it "should return http status 200" do
      expect(response).to have_http_status(200)
    end

    it "should display a form to edit the specified cat" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    context "valid params" do
      before { put :update, params: { id: registered_cat.id, cat: updated_params } }

      it "should return http status 302" do
        expect(response).to have_http_status(302)
      end

      it "should redirect to the show cat page" do
        expect(response).to redirect_to(cat_path(registered_cat))
      end
    end
  end

  # Delete records created by tests as the Capybara javascript tests require transactional_fixtures to be turned off
  after do
    Cat.destroy_all
    Breed.destroy_all
    CoatColour.destroy_all
    Gender.destroy_all
  end
end