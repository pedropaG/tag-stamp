class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :rows
      t.integer :columns
      t.string :name
      t.string :logo_uid
      t.string :logo_name

      t.timestamps
    end
  end
end
