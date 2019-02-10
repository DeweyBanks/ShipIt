class Order < ActiveRecord::Base
  belongs_to :vendor
  has_many :shipments
end
