require 'test_helper'

class AskTest < ActiveSupport::TestCase
  setup { @ask = asks(:jordan_worried) }
  
  test 'generate secret' do
    assert_equal 8, Ask.generate_secret.length
  end
  
  test 'belongs to user' do
    assert_equal users(:jordan), @ask.user
  end
  
  test 'belongs to question' do
    assert_equal questions(:worried), @ask.question
  end
  
  test 'create secret hash' do
    ask = Ask.new :user=>users(:admin), :question=>questions(:worried)
    ask.valid?
    assert !ask.secret.blank?
  end
  
end
