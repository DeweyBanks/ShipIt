class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.references :vendor, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
