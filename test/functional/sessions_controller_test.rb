require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test '/login with GET' do
    get :login
    assert_response :success
  end
  
  test '/authorize with valid credentials and POST' do
    user = users(:jordan)
    post :authorize, :email=>user.email, :password=>'password'
    assert_equal user.id, session[:user_id]
    assert_redirected_to root_url
  end
  
  test '/authorize with invalid credentials and POST' do
    post :authorize
    assert_redirected_to login_path
  end
  
  test '/logout' do
    login :jordan
    get :logout
    assert_nil session[:user_id]
    assert_redirected_to root_url
  end
  
end
