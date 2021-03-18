class AddShipAddressNumToShipAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :ship_addresses, :ship_address_num, :integer, null: false
  end
end
