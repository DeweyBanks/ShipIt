class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state_name
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
