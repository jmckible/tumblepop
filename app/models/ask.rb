class Ask < ActiveRecord::Base
  #############################################################################
  #                             S E C R E T S                                 #
  #############################################################################
  before_validation :on=>:create do
    self.secret = Ask.generate_secret
  end
  
  def self.generate_secret
    secret = ''
    existing = nil
    characters = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
    while secret == '' || existing
      1.upto(8) { secret << characters[rand(characters.size)]}
      existing = Ask.find_by_secret secret
    end
    secret
  end
  
  def from() "Tumblepop Stories <#{Ask.mailbox}+#{secret}@tumblepop.com>" end
  def self.mailbox() Rails.env.development? ? 'dev' : 'stories' end
  
  #############################################################################
  #                          R E L A T I O N S H I P S                        #
  #############################################################################
  belongs_to :question
  belongs_to :user
  
  has_many :stories
  
  #############################################################################
  #                             P R O C E S S I N G                           #
  #############################################################################
  def process!(email, subject, body)
    if user.email == email
      story = stories.build :title=>subject, :body=>body
      story.save
      story
    else
      user = User.find_by_email email
      if user
        ask = user.asks.find_by_question_id question.id
        if ask
          story = ask.stories.build :title=>subject, :body=>body
          story.save
          story
        else
          ask = user.asks.build :question=>question
          if ask.save
            story = ask.stories.build :title=>subject, :body=>body
            story.save
            story
          end
        end
      else
        user = User.new :name=>email.split('@').first, :email=>email
        password = user.reset_password
        if user.save
          UserMailer.welcome(user, password).deliver
          ask = user.asks.build :question=>question
          if ask.save
            story = ask.stories.build :title=>subject, :body=>body
            story.save
            story
          end
        end
      end
    end
  end
  
  #############################################################################
  #                             V A L I D A T I O N S                         #
  #############################################################################
  validates_presence_of :question_id, :user_id
  
end
