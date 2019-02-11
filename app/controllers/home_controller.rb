class HomeController < ApplicationController
  def index
    @shipment = Shipment.new
    @order = @shipment.build_order
    @address = @shipment.build_address
    @orders = Order.includes(:vendor, :shipment).paginate(:page => params[:page], :per_page => 10)
    @late_shipments = Shipment.urgent.paginate(:page => params[:page], :per_page => 5)
  end
end
