class AddPlayerReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :players, column: :reviewer_id
    add_index :reviews, :reviewer_id
    change_column_null :reviews, :reviewer_id, false
  end
end
