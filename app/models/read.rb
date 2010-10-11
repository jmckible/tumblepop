class Read < ActiveRecord::Base
  
  belongs_to :reader, :class_name=>'User'
  belongs_to :writer, :class_name=>'User'
  
  validates_presence_of   :reader_id, :writer_id
  validates_uniqueness_of :reader_id, :scope=>:writer_id
  
end
