class RenameAdressColumnToCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :adress, :address
  end
end
