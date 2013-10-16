class CreateUserFriends < ActiveRecord::Migration
  def change
    create_table :user_friends do |t|
      t.integer :user_uid
      t.integer :friend_uid
      t.timestamps
    end
    add_index :user_friends, :user_uid
    add_index :user_friends, :friend_uid
  end
end
