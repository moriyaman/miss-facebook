class CreateUserLikes < ActiveRecord::Migration
  def change
    create_table :user_likes do |t|
      t.integer :user_id
      t.integer :to_user_id
      t.timestamps
    end
    add_index :user_likes, :user_id
    add_index :user_likes, :to_user_id
  end
end
