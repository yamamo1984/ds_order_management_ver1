class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :order_num,              null: false, unique: true
      t.integer    :purchase_num,           null: false
      t.integer    :price,                  null: false
  
      t.references :user,                   null: false, foreign_key: true
    end  
  end
end
