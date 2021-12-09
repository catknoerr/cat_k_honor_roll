class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :dm_id
      t.string :rating
      t.integer :reviewer_id
      t.string :review

      t.timestamps
    end
  end
end
