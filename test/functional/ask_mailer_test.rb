require 'test_helper'

class AskMailerTest < ActionMailer::TestCase
  setup { @ask = asks(:jordan_worried) }
  
  test 'deliver ask' do
    email = AskMailer.inquiry @ask
    email.deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal [users(:jordan).email], email.to
  end
  
end
