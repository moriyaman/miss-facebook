class CreateOccupations < ActiveRecord::Migration
  def change
    create_table :occupations do |t|
      t.string :ja_name
      t.string :en_name
      t.timestamps
    end
  end
end
