class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_code
      t.string :item_color
      t.string :item_size
      t.integer :stock_num
      t.timestamps
    end
  end
end
