class StoryProcessor < ActionMailer::Base
  
  def receive(mail)
    if mail.to.to_s =~ /^(stories|dev)\+.{8}@tumblepop.com$/      
      secret = mail.to.to_s.gsub(/^(stories|dev)\+/, '').gsub(/@tumblepop.com$/, '')
      ask = Ask.find_by_secret! secret
      
      if mail.multipart?
        story = ask.process! mail.from.to_s, mail.subject, mail.parts.first.body
      else
        story = ask.process! mail.from.to_s, mail.subject, mail.body
      end
      
      StoryMailer.processed(story).deliver if story
      
    else
     raise 'Not a story'
    end
  end
  
end