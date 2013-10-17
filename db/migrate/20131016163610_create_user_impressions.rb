class CreateUserImpressions < ActiveRecord::Migration
  def change
    create_table :user_impressions do |t|
      t.integer :user_id
      t.timestamps
    end
    add_index :user_impressions, :user_id
  end
end
