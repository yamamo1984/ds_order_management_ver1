class ShipAddressesController < ApplicationController
  before_action :set_ship_address, only: [:index, :new, :show, :edit, :update]
  def index
    #顧客の配送先一覧を取得するための記述
    @ship_address = ShipAddress.where(customer_id: @customer_id)
  end  

  def new
    @ship_address = ShipAddress.new
  end  
  
  def create
    @ship_address = ShipAddress.new(ship_address_params)
    if @ship_address.save
      redirect_to customer_path(params[:customer_id])
  
    end  
  end   

  def show
    @ship_address = ShipAddress.find(params[:id])
  end  

  def edit
    @ship_address = ShipAddress.find(params[:id])
  end  

  def update
    @ship_address = ShipAddress.find(params[:id])
    @ship_address.update(ship_address_params)
    if @ship_address.save
      redirect_to customer_ship_address_path(params[:customer_id])
    else  
      render :edit
  end   

  def destroy
    ship_address = ShipAddress.find(params[:id])
    ship_address.destroy
  end  

  end  


  private
  def ship_address_params
    params.require(:ship_address).permit(:ship_address_num, :first_name, :last_name, :company, :tel, :post_code, :place_id, :city, :email, :street_num, :building, :memo).merge(customer_id: params[:customer_id])
  end

  def set_ship_address
    @customer_id = params[:customer_id]
    @customer = Customer.find(@customer_id)
  end  

end