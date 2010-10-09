require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup { @user = users(:jordan) }

  test '/admin/users with GET' do
    get :index
    assert_response :success
  end
  
  test '/admin/users/:id with GET' do
    get :index, :id=>@user
    assert_response :success
  end
  
  test '/admin/users/new with GET' do
    get :new
    assert_response :success
  end
  
  test '/admin/users with valid params and POST' do
    assert_difference('User.count') do
      post :create, :user=>{:email=>'new@user.com', :name=>'name'}
    end
    assert_redirected_to admin_user_path(assigns(:user))
  end
  
  test '/admin/users with invalid params and POST' do
    assert_no_difference('User.count') do
      post :create
    end
    assert_response :success
    assert_template :new
  end
  
  test '/admin/users/:id with valid params and PUT' do
    put :update, :id=>@user, :user=>{:name=>'name'}
    assert_equal 'name', @user.reload.name
    assert_redirected_to admin_user_path(@user)
  end
  
  test '/admin/users/:id with invalid params and PUT' do
    put :update, :id=>@user, :user=>{:email=>''}
    assert_not_equal '', @user.email
    assert_response :success
    assert_template :show
  end
  
  test '/admin/users/:id/toggle_admin with PUT' do
    put :toggle_admin, :id=>@user
    assert @user.reload.admin?
    assert_redirected_to admin_user_path(@user)
  end

end
