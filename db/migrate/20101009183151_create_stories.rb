class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.integer :ask_id
      t.string  :permalink, :title
      t.text    :body
      t.timestamps
    end
    
    add_index :stories, :ask_id
    add_index :stories, :permalink
  end

  def self.down
    drop_table :stories
  end
end
