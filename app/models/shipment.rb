class Shipment < ActiveRecord::Base
  belongs_to :order
  belongs_to :address
  has_one :vendor, :through => :order
  accepts_nested_attributes_for :order
  accepts_nested_attributes_for :address
  validates :tracking_number, uniqueness: { case_sensitive: false }
  after_create :set_expected_delivery_date
  # after_find :update_status
  scope :urgent, -> { where.not(status: "normal") }

  private

    def set_expected_delivery_date
      # step1: get shipment vendor
      # step2: get all shipments from vendor with same zipcode
      # step3: get average time for delivering to that zipcode
      average_dates = vendor.shipments.select do |x|
        address.zipcode == x.address.zipcode && x.id != id
      end

      averages = average_dates.map do |average|
        if average.delivered_at == nil
        else
          (average.delivered_at - average.shipped_at)/ 1.day
        end
      end
      if averages.empty?
      else
        days = averages.compact.inject(0.0) { |sum,el| sum + el } / averages.size
        # step4: set add the average time to delivered_at time
        # and set as expected_delivery_date
        self.expected_delivery_date = Time.now + days.days
        self.save
      end
    end

    def update_status
      # step1: get expected delivery date
      # step2: get current date
      # step3: if current date is one week before expected date
      # set as normal
      # if current date is equal or less than a day greater than
      # expected date then set as not normal.
      # if current date is greater than one day set to very late.

        # if Time.now.beginning_of_day - 7.days < self.expected_delivery_date
        #   self.status = "normal"
        # elsif Time.now.beginning_of_day - 1.days >= self.expected_delivery_date
        #   self.status = "not normal"
        # else
        #   self.status = "very late"
        # end
        # self.save
    end
end

