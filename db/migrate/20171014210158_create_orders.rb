class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.date :date
      t.string :full_name
      t.date :shipment_date
      t.string :street
      t.string :street2
      t.string :city
      t.string :country
      t.string :zip_number
      t.boolean :printed, null: false, default: false
      t.datetime :printed_at

      t.timestamps
    end
  end
end
