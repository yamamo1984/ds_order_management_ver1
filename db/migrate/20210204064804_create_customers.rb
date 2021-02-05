class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :post_code_1
      t.integer :post_code_2
      t.string :email
      t.string :tel_num
      t.string :prefecture
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :memo
      t.timestamps
    end
  end
end
