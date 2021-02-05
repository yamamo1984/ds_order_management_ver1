class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|
      t.integer :post_code_1
      t.integer :post_code_2
      t.string :prefecture
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :tel
      t.integer :customer_id
      t.timestamps
    end

  end

end
