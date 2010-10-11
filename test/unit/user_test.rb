require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup{ @user = users(:jordan) }
  
  #############################################################################
  #                          R E L A T I O N S H I P S                        #
  #############################################################################
  test 'has many asks' do
    assert_equal 1, @user.asks.count
  end
  
  test 'has many stories' do
    assert_equal 1, @user.stories.count
  end
  
  test 'has many readerships' do
    assert_equal 1, @user.readerships.count
  end
  
  test 'has many writerships' do
    assert_equal 1, @user.writerships.count
  end
  
  #############################################################################
  #                                   R E A D S                               #
  #############################################################################
  test 'allow new read' do
    assert_difference 'Read.count' do
      read = @user.reads users(:lindsey)
      assert_equal @user, read.reader
      assert_equal users(:lindsey), read.writer
    end
  end
  
  test 'allow exisiting read' do
    assert_no_difference 'Read.count' do
      assert_equal reads(:jordan_lindsey), users(:lindsey).reads(@user)
    end
  end
  
  test 'allow existing turned off read' do
    assert_no_difference 'Read.count' do
      assert_equal reads(:admin_jordan), @user.reads(users(:admin))
      assert reads(:admin_jordan).reload.allowed
    end
  end
  
  #############################################################################
  #                             V A L I D A T I O N                           #
  #############################################################################
  test 'admin protected' do
    @user.update_attributes :admin=>true
    assert !@user.admin?
  end

end
