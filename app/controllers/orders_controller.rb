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
    order.update(order_params_for_edit)
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
    params.require(:order_ship_address).permit(:order_num, :purchase_num, :price, :customer_id, :ship_address_num, :first_name, :last_name, :email, :company, :tel, :post_code, :place_id, :city, :street_num, :building, :memo, :ship_address_id).merge(user_id: current_user.id, ship_address_id: @ship_address_id)
  end

  #オーダーeditアクションにおいて、配送先などのパラメータを受け取らない場合に使用するメソッド
  def order_params_for_edit
    params.require(:order).permit(:order_num, :purchase_num, :price, :customer_id, :ship_address_id)
  end

  


  
  def set_order
    @order = Order.find(params[:id])

  end  

  
end 
