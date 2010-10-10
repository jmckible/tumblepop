require 'test_helper'

class DayTest < ActiveSupport::TestCase
  setup { @day = days(:today) }
  
  test 'belongs to question' do
    assert_equal questions(:worried), @day.question
  end
  
end
