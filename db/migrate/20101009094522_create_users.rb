class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :name, :password_hash, :password_salt
      t.boolean :admin, :default=>false
      t.timestamps
    end
    
    add_index :users, :email, :uniq=>true
  end

  def self.down
    drop_table :users
  end
end
