require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get "/signup"
      expect(response).to have_http_status(:success)
    end
  end

  context "" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    it "GET /signup" do
      get signup_path
      expect(response).to have_http_status(:success)
    end

    it "should redirect edit when not logged in" do
      get edit_user_path(user)
      expect(flash.empty?).to eq false
      expect(response).to redirect_to login_url
    end

    it "should redirect update when not logged in" do
      patch user_path(user), params: { user: { name: user.name,
                                                email: user.email } }
      expect(flash.empty?).to eq false
      expect(response).to redirect_to login_url
    end
  end
end
