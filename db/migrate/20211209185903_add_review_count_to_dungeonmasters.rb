class AddReviewCountToDungeonmasters < ActiveRecord::Migration[6.0]
  def change
    add_column :dungeonmasters, :reviews_count, :integer
  end
end
