class ShipAddressesController < ApplicationController
  def index
    @customer_id = params[:customer_id]
    @ship_address = ShipAddress.where(customer_id: @customer_id)
  end  

  def new
    @ship_address = ShipAddress.new
  end  
  
  def create
    @ship_address = ShipAddress.new(ship_address_params)
    if @ship_address.save
       redirect_to ship_address_path(@ship_address)
    end  
  end   

  def show
    @ship_address = ShipAddress.where(params[:id])
  end  

end