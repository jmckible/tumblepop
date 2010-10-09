class Story < ActiveRecord::Base
  has_permalink :title
  
  belongs_to :ask
  
  delegate :question, :to=>:ask
  delegate :user,     :to=>:ask
  
  def to_param() permalink end

  validates_presence_of   :ask_id, :title
  validates_uniqueness_of :ask_id
  
end
