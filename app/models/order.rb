class Order < ActiveRecord::Base
  belongs_to :vendor
  has_one :shipment
  validates :number, uniqueness: { case_sensitive: false }
  scope :active, -> { where(status: 'active') }
end
