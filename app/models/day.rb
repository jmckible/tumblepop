class Day < ActiveRecord::Base
  
  belongs_to :question
  
  scope :since, lambda{|date| where(["date >= ?", date])}
  
  default_scope order('date')
  
  validates_presence_of   :date, :question_id
  validates_uniqueness_of :date
  
end
