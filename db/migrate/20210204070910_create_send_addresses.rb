class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|
      t.string :post_code
      t.string :prefecture
      t.string :adress_1
      t.string :address_2
      t.string :address_3
      t.string :tel
      t.integer :customer_id
      t.timestamps
    end

  end

end
