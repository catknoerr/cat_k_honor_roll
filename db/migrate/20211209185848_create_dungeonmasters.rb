class CreateDungeonmasters < ActiveRecord::Migration[6.0]
  def change
    create_table :dungeonmasters do |t|
      t.string :description
      t.string :preferences
      t.string :photo
      t.integer :years_experience
      t.integer :age
      t.string :characters

      t.timestamps
    end
  end
end
