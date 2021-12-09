class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :photo
      t.string :location
      t.integer :age
      t.string :description
      t.string :preferences
      t.string :characters

      t.timestamps
    end
  end
end
