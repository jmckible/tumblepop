class StoryMailer < ActionMailer::Base
    
  def processed(story)
    @story = story
    @user  = story.user
    
    mail :from=>"Tumblepop Stories <#{Ask.mailbox}@tumblepop.com>", 
         :to=>@user.email, 
         :subject=>"Added: #{@story.title}"
  end
  
end
