class AddEmailToShipAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :ship_addresses, :email, :string
  end
end
