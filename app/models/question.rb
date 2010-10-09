class Question < ActiveRecord::Base
  has_permalink :prompt
  
  def to_param() permalink end
  
  validates_presence_of   :prompt
  validates_uniqueness_of :prompt
end
