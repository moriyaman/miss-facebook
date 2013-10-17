class CreateUserScores < ActiveRecord::Migration
  def change
    create_table :user_scores do |t|
      t.integer :user_id
      t.integer :score
      t.timestamps
    end
    add_index :user_scores, :user_id
  end
end
