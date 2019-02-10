class Shipment < ActiveRecord::Base
  belongs_to :order
  belongs_to :address
  has_one :vendor, :through => :order
  accepts_nested_attributes_for :order
  accepts_nested_attributes_for :address
  validates :tracking_number, uniqueness: { case_sensitive: false }
  after_create :set_expected_delivery_date
  after_touch :update_status


  private

    def set_expected_delivery_date
      # step1: get shipment vendor
      # step2: get all shipments from vendor with same zipcode
      # step3:
    end

    def update_status
    end
end

