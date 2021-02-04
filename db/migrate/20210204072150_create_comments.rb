class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :user_id
      t.string :order_id
      t.timestamps
    end
  end
end
