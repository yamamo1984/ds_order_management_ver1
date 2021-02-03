class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_num
      t.references :item_code
      t.integer :purchase_num
      t.references :color
      t.references :size
      t.integer :price_one
      t.integer :price_sum
      t.text :purchase_memo


      t.timestamps
    end
  end
end
