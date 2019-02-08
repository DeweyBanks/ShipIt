require 'rails_helper'

RSpec.describe VendorsController, type: :controller do
  describe "viewing all vendors" do
    before do
      get :index
    end

    it "returns all vendors" do
      expect(assigns(:vendors)).to eq(Vendor.all)
    end
  end

  describe "viewing a single vendor" do
    before do
      @vendor = Vendor.create(name: "Test Company")
      get :show, id: @vendor.id
    end

    it "assigns a vendor" do
      expect(assigns(:vendor)).to eq(@vendor)
    end
  end
end
