class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :code,             null: false
      t.string     :name,             null: false    
      t.integer    :price,            null: false 
      t.string     :color,            null: false 
      t.string     :size,             null: false 
      t.integer    :stock_num,        null: false
      t.string     :memo,             null: false          
      t.timestamps
    end
  end
end
