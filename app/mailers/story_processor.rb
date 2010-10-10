class StoryProcessor < ActionMailer::Base
  
  def receive(mail)     
    if mail.to.to_s =~ /^stories\+.{8}@tumblepop.com$/
      secret = mail.to.to_s.gsub(/^stories\+/, '').gsub(/@tumblepop.com$/, '')
      ask = Ask.find_by_secret! secret
      ask.process! mail.from.to_s, mail.subject, mail.body
    else
      raise 'Not a story'
    end
  end
  
end