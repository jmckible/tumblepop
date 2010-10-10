require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  
  test '/ with GET' do
    get :index
    assert_response :success
  end
  
  test '/stories/:id with GET' do
    get :show, :id=>stories(:jordan_worried).to_param
    assert_response :success
  end
  
end
