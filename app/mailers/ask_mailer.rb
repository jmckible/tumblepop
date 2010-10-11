class AskMailer < ActionMailer::Base
    
  def inquiry(ask)
    @ask  = ask
    @user = ask.user
    @question = ask.question
    
    mail :from=>@ask.from, :to=>@user.email, :subject=>@question.prompt
  end
  
end
