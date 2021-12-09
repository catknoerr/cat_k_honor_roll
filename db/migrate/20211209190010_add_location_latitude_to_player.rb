class AddLocationLatitudeToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :location_latitude, :float
  end
end
