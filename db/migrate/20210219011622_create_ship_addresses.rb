class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.string     :first_name,         null: false
      t.string     :last_name,          null: false
      t.string     :company           
      t.string     :tel,                null: false 
      t.string     :post_code,          null: false 
      t.integer    :place_id,           null: false 
      t.string     :city,               null: false 
      t.string     :street_num,         null: false 
      t.string     :building             
      t.text       :memo
      t.references :customer,           null: false,  foreign_key: true
      t.references :order,              null: false,  foreign_key: true
      t.timestamps
    end
  end
end
