require 'test_helper'

class Admin::AsksControllerTest < ActionController::TestCase
  
  test '/admin/asks with POST' do
    user = users(:admin)
    assert_difference 'Ask.count' do
      post :create, :ask=>{:user_id=>user.id, :question_id=>questions(:worried).id}
    end
    assert_redirected_to admin_user_path(user)
  end
  
end