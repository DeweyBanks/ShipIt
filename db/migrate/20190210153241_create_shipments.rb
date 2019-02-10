class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :tracking_number
      t.references :order, index: true, foreign_key: true
      t.datetime :expected_delivery_date
      t.string :status

      t.timestamps null: false
    end
  end
end
