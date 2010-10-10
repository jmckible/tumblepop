require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test '/settings logged in with GET' do
    login :jordan
    get :show
    assert_response :success
  end
  
  test '/settings without login and GET' do
    get :show
    assert_redirected_to login_url
  end
  
  test '/settings with valid params and PUT' do
    login :jordan
    put :update, :user=>{:name=>'new name'}
    assert_equal 'new name', @current_user.reload.name
    assert_redirected_to user_url
  end
  
  test '/settings with invalid params and PUT' do
    login :jordan
    put :update, :user=>{:name=>''}
    assert_not_equal '', @current_user.reload.name
    assert_response :success
  end
  
end