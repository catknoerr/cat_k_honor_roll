class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :location
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :dm_id
      t.integer :player_id

      t.timestamps
    end
  end
end
