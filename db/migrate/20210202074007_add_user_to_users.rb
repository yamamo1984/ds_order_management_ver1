class AddUserToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user, :string
    add_column :users, :position, :text
    add_column :users, :memo, :text
  end
end
