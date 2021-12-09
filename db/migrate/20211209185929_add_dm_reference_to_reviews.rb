class AddDmReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :dungeonmasters, column: :dm_id
    add_index :reviews, :dm_id
    change_column_null :reviews, :dm_id, false
  end
end
