# test/controllers/home_controller_test.rb
require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::ControllerHelpers

  # def setup
  #   @user = users(:michael)
  # end

  # test "layout links" do
  # 	assert is_logged_in?
  #   get root_path
  #   assert_select link_to "", root_path 
  #   assert_select link_to "", new_user_session_path
  #   assert_select link_to "", new_user_registration_path
  #   log_in_as(@user)
  #   assert_select link_to "", root_path
  #   assert_select link_to "", home_private_path
  #   assert_select link_to "", destroy_user_session_path
  # end

  test 'authenticated users can GET index' do
    sign_in users(:bob)

    get :index
    assert_response :success
  end

end