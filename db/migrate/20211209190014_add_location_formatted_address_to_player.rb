class AddLocationFormattedAddressToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :location_formatted_address, :string
  end
end
