require 'test_helper'

class AskTest < ActiveSupport::TestCase
  setup { @ask = asks(:jordan_worried) }
  
  #############################################################################
  #                           L I F E C Y C L E                               #
  #############################################################################
  test 'generate secret' do
    assert_equal 8, Ask.generate_secret.length
  end
  
  test 'create secret hash' do
    ask = Ask.new :user=>users(:admin), :question=>questions(:worried)
    ask.valid?
    assert !ask.secret.blank?
  end
  
  #############################################################################
  #                          R E L A T I O N S H I P S                        #
  #############################################################################
  test 'belongs to user' do
    assert_equal users(:jordan), @ask.user
  end
  
  test 'belongs to question' do
    assert_equal questions(:worried), @ask.question
  end
  
  test 'has many stories' do
    assert_equal 1, @ask.stories.count
  end
  
  #############################################################################
  #                             P R O C E S S I N G                           #
  #############################################################################
  test 'new story from expected user' do
    assert_difference 'Story.count' do
      story = @ask.process! users(:jordan).email, 'New Story','the body'
    end
  end
  
  test 'new story from another known user with ask' do
    assert_difference 'Story.count' do
      assert_no_difference 'Ask.count' do
        story = @ask.process! users(:lindsey).email, 'New Story','the body'
        assert_equal users(:lindsey), story.user
      end
    end
  end
  
  test 'new story from another known user without ask' do
    assert_difference 'Story.count' do
      assert_difference 'Ask.count' do
        story = @ask.process! users(:admin).email, 'New Story','the body'
        assert_equal users(:admin), story.user
      end
    end
  end
  
  test 'new story from unknown user without ask' do
    assert_difference 'Story.count' do
      assert_difference 'Ask.count' do
        assert_difference 'User.count' do
          story = @ask.process! 'jordan+new@mckible.com', 'New Story','the body'
          assert_equal 'jordan+new@mckible.com', story.user.email
          assert_equal 'jordan+new', story.user.name
        end
      end
    end
  end
  
end
