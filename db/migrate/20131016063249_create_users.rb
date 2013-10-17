class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick_name
      t.integer :country_id
      t.string :address
      t.date :birthday
      t.integer :gender_id
      t.integer :occupation_id
      t.string :mail
      t.integer :uid, :limit => 8
      t.boolean :friend_allow_flg, :default => false
      t.boolean :closed_flg, :default => false
      t.text :self_introduction, :limit => 64.kilobytes + 1
      t.string :access_token
      t.datetime :oauth_expires_at
      t.timestamps
    end
    add_index :users, :country_id
    add_index :users, :gender_id
    add_index :users, :occupation_id
    add_index :users, :uid
    add_index :users, :friend_allow_flg
    add_index :users, :closed_flg
    add_index :users, :oauth_expires_at
  end
end
