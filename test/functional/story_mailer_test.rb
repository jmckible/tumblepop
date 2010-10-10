require 'test_helper'

class StoryMailerTest < ActionMailer::TestCase
  setup { @story = stories(:jordan_worried) }
  
  test 'deliver ask' do
    email = StoryMailer.processed @story
    email.deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal [users(:jordan).email], email.to
  end
  
end
