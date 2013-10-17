class CreateUserImpressions < ActiveRecord::Migration
  def change
    create_table :user_impressions do |t|
      t.integer :user_id
      t.integer :to_user_id
      t.timestamps
    end
    add_index :user_impressions, :user_id
    add_index :user_impressions, :to_user_id
  end
end
