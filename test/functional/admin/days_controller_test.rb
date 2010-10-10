require 'test_helper'

class Admin::DaysControllerTest < ActionController::TestCase
  setup{ login :admin }

  test '/admin/days with GET' do
    get :index
    assert_response :success
  end
  
  test '/admin/days with new date and POST' do
    assert_difference 'Day.count' do
      post :create, :day=>{:date=>Date.tomorrow, :question_id=>questions(:car).id}
      assert_redirected_to admin_days_url
    end
  end
  
  test '/admin/days with existing date and POST' do
    assert_no_difference 'Day.count' do
      post :create, :day=>{:date=>Date.today, :question_id=>questions(:car).id}
      assert_equal questions(:car), days(:today).question
      assert_redirected_to admin_days_url
    end
  end
  
end