class AddLocationLongitudeToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :location_longitude, :float
  end
end
