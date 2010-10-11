require 'test_helper'

class ReadTest < ActiveSupport::TestCase
  setup { @read = reads(:jordan_lindsey) }
  
  test 'reader' do
    assert_equal users(:lindsey), @read.reader
  end
  
  test 'writer' do
    assert_equal users(:jordan), @read.writer
  end
  
end
