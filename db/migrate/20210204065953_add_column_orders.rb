class AddColumnOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :customer_id, :integer
    add_column :orders, :item_id, :integer


  end
end
