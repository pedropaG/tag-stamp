class AddOrderColumnNamesToUsers < ActiveRecord::Migration[5.0]
  def change
	add_column :users, :order_number, :string
	add_column :users, :full_name, :string
	add_column :users, :street, :string
	add_column :users, :street2, :string
	add_column :users, :zip_number, :string
	add_column :users, :city, :string
	add_column :users, :state, :string
	add_column :users, :country, :string
  end
end
