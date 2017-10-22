class AddPageConfigurationFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
	add_column :users, :page_margin_left, :integer, default: 0
	add_column :users, :page_margin_right, :integer, default: 0
	add_column :users, :page_margin_top, :integer, default: 0
	add_column :users, :page_margin_bottom, :integer, default: 0
	add_column :users, :tag_margin_left, :integer, default: 0
	add_column :users, :tag_margin_right, :integer, default: 0
	add_column :users, :tag_margin_top, :integer, default: 0
	add_column :users, :tag_margin_bottom, :integer, default: 0
	add_column :users, :page_width, :integer, default: 210
	add_column :users, :page_height, :integer, default: 297
  end
end
