require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup{ @user = users(:jordan) }
  
  test 'has many asks' do
    assert_equal 1, @user.asks.count
  end
  
  test 'has many stories' do
    assert_equal 1, @user.stories.count
  end
  
  test 'admin protected' do
    @user.update_attributes :admin=>true
    assert !@user.admin?
  end

end
