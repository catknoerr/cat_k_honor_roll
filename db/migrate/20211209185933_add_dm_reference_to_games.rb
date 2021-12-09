class AddDmReferenceToGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :dungeonmasters, column: :dm_id
    add_index :games, :dm_id
    change_column_null :games, :dm_id, false
  end
end
