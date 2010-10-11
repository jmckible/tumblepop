require 'test_helper'

class Admin::ReadsControllerTest < ActionController::TestCase
  setup{ login :admin }
  
  test '/admin/reads/:id/toggle with PUT' do
    put :toggle, :id=>reads(:jordan_lindsey)
    assert !reads(:jordan_lindsey).reload.allowed
    assert_redirected_to admin_user_path(users(:jordan))
  end

end
