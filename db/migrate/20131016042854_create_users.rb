class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick_name
      t.integer :country_id
      t.string :address 
      t.date :birthday
      t.integer :gender
      t.integer :occupation_id
      t.string :mail
      t.integer :uid, :limit => 8
      t.string :access_token
      t.boolean :friend_allow_flg, :default => false
      t.boolean :closed_flg, :default => false
      t.text :self_introduction, :limit => 64.kilobytes + 1 
      t.timestamps
    end
    add_index :users, :country_id
    add_index :users, :gender
    add_index :users, :friend_allow_flg
    add_index :users, :closed_flg
  end
end
