class CreateAsks < ActiveRecord::Migration
  def self.up
    create_table :asks do |t|
      t.integer  :user_id, :question_id
      t.string   :secret
      t.timestamps
    end
    
    add_index :asks, :user_id
    add_index :asks, :question_id
    add_index :asks, :secret
  end

  def self.down
    drop_table :asks
  end
end
