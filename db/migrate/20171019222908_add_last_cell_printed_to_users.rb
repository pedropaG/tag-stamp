class AddLastCellPrintedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_cell_printed, :integer
  end
end
