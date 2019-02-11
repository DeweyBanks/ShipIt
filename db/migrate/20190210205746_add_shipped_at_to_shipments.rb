class AddShippedAtToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :shipped_at, :datetime
    add_column :shipments, :delivered_at, :datetime
  end
end
