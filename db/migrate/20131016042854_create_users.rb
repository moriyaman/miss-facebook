class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick_name
      t.integer :country_id
      t.string :address 
      t.integer :age
      t.integer :sex
      t.integer :occupation_id
      t.integer :mail
      t.integer :uid, :limit => 8
      t.string :access_token
      t.timestamps
    end
  end
end
