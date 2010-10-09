require 'test_helper'

class UserPasswordTest < ActiveSupport::TestCase
  setup { @user = users(:jordan) }

  #####################################################################
  #                     C L A S S    M E T H O D S                    #
  #####################################################################
  test 'sha1' do
    assert_equal Digest::SHA1.hexdigest('passwordsalt'), User.encrypt('password', 'salt')
  end
  
  test 'password generation' do
    assert_equal 8, User.generate_password.length
  end
  
  #####################################################################
  #                     A U T H E N T I C A T I O N                   #
  #####################################################################
  test 'valid authentication' do 
    assert_equal @user, User.authenticate(@user.email, 'password')
  end
  
  test 'invalid password' do
    assert_nil User.authenticate(@user.email, 'invalid')
  end
  
  test 'invalid email and password' do
    assert_nil User.authenticate('fake', 'faker')
  end
  
  test 'no password' do
    assert_nil User.authenticate(@user.email, nil)
  end
  
  #####################################################################
  #               P A S S W O R D    A T T R I B U T E                #
  #####################################################################
  test 'virtual password attribute' do
    assert @user.respond_to?(:password)
    assert @user.respond_to?(:password=)
  end
  
  test 'change password with confirmation' do
    @user.password = 'newpassword11'
    @user.password_confirmation = 'newpassword11'
    @user.save
    assert_equal @user, User.authenticate(@user.email, 'newpassword11')
  end
  
  test 'password reset' do
    assert_equal @user, User.authenticate(@user.email, 'password')
    @user.reset_password
    assert @user.save
    assert_nil User.authenticate(@user.email, 'password')
  end
  
  #####################################################################
  #                          L I F E C Y C L E                        #
  #####################################################################
  test 'encrypt password before save' do
    user = User.new :email=>'new@email.com', :password=>'password1', :password_confirmation=>'password1'
    assert user.save
    assert !user.password_hash.empty?
    assert !user.password_salt.empty?
  end
  
  #####################################################################
  #                       V A L I D A T I O N S                       #
  #####################################################################
  test 'password confirmation' do
    user = User.new :password=>'password'
    assert !user.valid?
    assert !user.errors[:password_confirmation].blank?
  end
  
  test 'minimum password length of 6' do
    user = User.new :password=>'12345'
    assert !user.valid?
    assert !user.errors[:password].blank?
  end
  
  test 'maximum password length of 40' do
    user = User.new :password=>'1                                        '
    assert !user.valid?
    assert !user.errors[:password].blank?
  end
  
  #####################################################################
  #                        P R O T E C T I O N S                      #
  #####################################################################
  test 'do not update password hash through mass assignment' do
    @user.update_attributes! :password_hash=>'updated'
    assert_not_equal 'updated', @user.password_hash
  end
  
  test 'do not update password salt through mass assignment' do
    @user.update_attributes! :password_salt=>'updated'
    assert_not_equal 'updated', @user.password_salt
  end

end