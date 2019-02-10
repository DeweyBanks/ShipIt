class AddAddressToShipments < ActiveRecord::Migration
  def change
    add_reference :shipments, :address, index: true, foreign_key: true
  end
end
