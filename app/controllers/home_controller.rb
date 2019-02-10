class HomeController < ApplicationController
  def index
    @shipment = Shipment.new
    @order = @shipment.build_order
    @address = @shipment.build_address
    @orders = Order.includes(:vendor, :shipment).active
                .paginate(:page => 1, :per_page => 5)

  end
end
