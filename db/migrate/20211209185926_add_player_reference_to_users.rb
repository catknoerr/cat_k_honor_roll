class AddPlayerReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :players
    add_index :users, :player_id
    change_column_null :users, :player_id, false
  end
end
