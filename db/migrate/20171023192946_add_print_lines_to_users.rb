class AddPrintLinesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :print_lines, :boolean, default: false, null: false
  end
end
