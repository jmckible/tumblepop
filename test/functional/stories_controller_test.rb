require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  
  test '/ with GET' do
    get :index
    assert_response :success
  end
  
end
