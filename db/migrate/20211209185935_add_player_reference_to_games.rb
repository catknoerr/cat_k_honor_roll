class AddPlayerReferenceToGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :players
    add_index :games, :player_id
  end
end
