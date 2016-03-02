require 'rails_helper'

RSpec.describe RatingsController, type: :controller do

  describe "GET #add_ambul" do
    it "returns http success" do
      get :add_ambul
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add_hospital" do
    it "returns http success" do
      get :add_hospital
      expect(response).to have_http_status(:success)
    end
  end

end
