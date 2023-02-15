require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get "/signup"
      expect(response).to have_http_status(:success)
    end
  end

  fixtures :all

  before do
    @user = users(:michael)
    @other_user = users(:archer)
  end

  it "GET /signup" do
    get signup_path
    expect(response).to have_http_status(:success)
  end

  it "should redirect edit when not logged in" do
    get edit_user_path(@user)
    expect(flash.empty?).to eq false
    expect(response).to redirect_to login_url
  end

  it "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    expect(flash.empty?).to eq false
    expect(response).to redirect_to login_url
  end

  # it "should redirect edit when logged in as wrong user" do
  #   # log_in_as(@other_user)
  #   session[:user_id] = user.id
  #   get edit_user_path(@user)
  #   expect(flash.empty?).to eq false
  #   expect(response).to redirect_to root_url
  # end

  # test "should redirect update when logged in as wrong user" do
  #   log_in_as(@other_user)
  #   patch user_path(@user), params: { user: { name: @user.name,
  #                                             email: @user.email } }
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end

  # test "should not allow the admin attribute to be edited via the web" do
  #   log_in_as(@other_user)
  #   assert_not @other_user.admin?
  #   patch user_path(@other_user), params: {
  #                                   user: { password:              "password",
  #                                           password_confirmation: "password",
  #                                           admin: true} }
  #   assert_not @other_user.reload.admin?
  # end

  # test "should redirect index when not logged in" do
  #   get users_path
  #   assert_redirected_to login_url
  # end

  # test "should redirect destroy when not logged in" do
  #   assert_no_difference 'User.count' do
  #     delete user_path(@user)
  #   end
  #   assert_redirected_to login_url
  # end

  # test "should redirect destroy when logged in as a non-admin" do
  #   log_in_as(@other_user)
  #   assert_no_difference 'User.count' do
  #     delete user_path(@user)
  #   end
  #   assert_redirected_to root_url
  # end

end
