require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup { @user = users(:jordan) }
  
  test 'deliver welcome' do
    email = UserMailer.welcome @user, 'password'
    email.deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal [@user.email], email.to
  end
  
end
