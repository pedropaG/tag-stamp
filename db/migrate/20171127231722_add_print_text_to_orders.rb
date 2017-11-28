class AddPrintTextToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :print_text, :text
  end
end
