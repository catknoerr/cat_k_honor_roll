class AddDmReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :dungeonmasters, column: :dm_id
    add_index :users, :dm_id
  end
end
