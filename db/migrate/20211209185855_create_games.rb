class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :dm_id
      t.integer :player_id
      t.date :date
      t.time :time
      t.integer :capacity
      t.string :location

      t.timestamps
    end
  end
end
