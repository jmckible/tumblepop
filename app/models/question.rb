class Question < ActiveRecord::Base
  has_permalink :prompt
  
  validates_presence_of   :prompt
  validates_uniqueness_of :prompt
end
