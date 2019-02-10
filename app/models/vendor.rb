class Vendor < ActiveRecord::Base
  has_many :orders
  has_many :shipments, through: :orders

end
