class Ask < ActiveRecord::Base
  
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
  
  belongs_to :question
  belongs_to :user
  
  has_many :stories
  
  before_validation :on=>:create do
    self.secret = Ask.generate_secret
  end
  
  validates_presence_of :question_id, :user_id
  
end
