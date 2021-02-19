class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :show]

  def index
    @order = Order.all
  end   
  
  def new
    @order = OrderShipAddress.new
  end

  def create
    @order = OrderShipAddress.new(order_params)
    if @order.save
      redirect_to orders_path(@order)
    else  
      render :new
    end   
  end

  def edit
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
     if order.save
       redirect_to orders_path
    else  
      render :edit
    end   
  end  

  def destroy
    order = Order.find(params[:id])
    order.destroy
  end  

  def show
  end  
  
  private
  def order_params
    params.require(:order_ship_address).permit(:order_num, :purchase_num, :price, :customer_id, :first_name, :last_name, :company, :tel, :post_code, :place_id, :city, :street_num, :building, :memo).merge(user_id: current_user.id)
  end

  def set_order
    @order = Order.find(params[:id])
  end  

  
end 
