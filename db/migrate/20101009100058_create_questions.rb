class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :permalink
      t.text :prompt
      t.timestamps
    end
    
    add_index :questions, :permalink
  end

  def self.down
    drop_table :questions
  end
end
