require 'test_helper'

class Admin::AsksControllerTest < ActionController::TestCase
  setup { login :admin }
  
  test '/admin/asks with POST' do
    user = users(:admin)
    assert_difference 'Ask.count' do
      post :create, :ask=>{:user_id=>user.id, :question_id=>questions(:worried).id}
    end
    assert_redirected_to admin_user_path(user)
  end
  
  test '/admin/asks/:id/deliver with PUT' do
    put :deliver, :id=>asks(:jordan_worried)
    assert_redirected_to admin_user_path(users(:jordan))
  end
  
end