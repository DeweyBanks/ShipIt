class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

end
