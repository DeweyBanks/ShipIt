class ShipmentsController < ApplicationController

  def index
  end

  def show
    @shipment = Shipment.includes(:vendor).find(params[:id])
  end

  def new
    @shipment = Shipment.new
    @order = @shipment.build_order
    @address = @shipment.build_address
  end

  def create
    @shipment = Shipment.new(shipment_params)

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def shipment_params
      params.require(:shipment).permit(
        :tracking_number,
        :status,
        :expected_delivery_date,
        :shipped_at,
        :delivered_at,
        order_attributes: [:id, :number, :vendor_id, :status ],
        address_attributes: [:id, :address1, :address2, :city, :zipcode, :state_name]
      )
    end
end








