class StoryProcessor < ActionMailer::Base
  attr_accessor :mail
  
  def receive(tmail) 
    @mail = tmail
    process
  end
  
  def process
    puts "To: #{mail.to}\nFrom: #{mail.from}\nSubject: #{mail.subject}\n"
  end
  
end