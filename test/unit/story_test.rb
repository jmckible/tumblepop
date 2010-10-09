require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  
  test 'generate permalink' do
    story = Story.new :title=>'title'
    story.valid?
    assert_equal 'title', story.permalink
  end
  
  test 'belongs to ask' do
    assert_equal asks(:jordan_worried), stories(:jordan_worried).ask
  end
  
end
