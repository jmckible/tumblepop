class CreateReads < ActiveRecord::Migration
  def self.up
    create_table :reads do |t|
      t.integer :reader_id, :writer_id
      t.boolean :allowed, :default=>true
      t.timestamps
    end
    
    add_index :reads, :reader_id
    add_index :reads, :writer_id
    add_index :reads, [:reader_id, :writer_id], :uniq=>true
  end

  def self.down
    drop_table :reads
  end
end
