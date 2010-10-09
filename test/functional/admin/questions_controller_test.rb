require 'test_helper'

class Admin::QuestionsControllerTest < ActionController::TestCase

  test '/admin/questions' do
    get :index
    assert_response :success
  end

end
