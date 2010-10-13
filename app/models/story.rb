class Story < ActiveRecord::Base
  has_permalink :title, :update=>true
  
  belongs_to :ask
  
  scope :newest, order('created_at desc')
  
  delegate :question, :to=>:ask
  delegate :user,     :to=>:ask
  
  def to_param() permalink end

  validates_presence_of :ask_id, :title
  
end
