require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup{ @user = users(:jordan) }
  
  test 'admin protected' do
    @user.update_attributes :admin=>true
    assert !@user.admin?
  end

end
