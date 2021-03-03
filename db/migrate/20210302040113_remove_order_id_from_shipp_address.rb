class RemoveOrderIdFromShippAddress < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ship_addresses, :order, foreign_key: true
  end
end
