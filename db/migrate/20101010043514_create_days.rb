class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.date :date
      t.integer :question_id
      t.timestamps
    end
    
    add_index :days, :date
    add_index :days, :question_id
  end

  def self.down
    drop_table :days
  end
end
