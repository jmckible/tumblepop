require 'test_helper'

class AskMailerTest < ActionMailer::TestCase
  setup { @ask = asks(:jordan_worried) }
  
  test 'deliver ask' do
    email = AskMailer.inquery @ask
    email.deliver
    assert !ActionMailer::Base.deliveries.empty?
    
    assert_equal [users(:jordan).email], email.to
    assert_equal questions(:worried).prompt, email.subject
    assert_equal [@ask.from], email.from
  end
  
end
