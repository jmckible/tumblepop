require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  
  test '/admin with admin and GET' do
    login :admin
    get :index
    assert_response :success
  end
  
  test '/admin without admin and GET' do
    login :jordan
    get :index
    assert_redirected_to login_url
  end
  
  test '/admin without user and GET' do
    get :index
    assert_redirected_to login_url
  end
  
end