class AddPreparedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :prepared, :boolean, default: false, null: false
  end
end
