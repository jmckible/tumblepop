class UserMailer < ActionMailer::Base
    
  def welcome(user, password)
    @user = user
    @password = password
    mail :from=>"Tumblepop <#{Ask.mailbox}@tumblepop.com>", 
         :to=>@user.email, 
         :subject=>"Welcome to Tumblepop"
  end
  
end
