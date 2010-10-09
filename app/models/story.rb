class Story < ActiveRecord::Base
  has_permalink :title
  
  belongs_to :ask

  validates_presence_of   :ask_id
  validates_uniqueness_of :ask_id
  
end
