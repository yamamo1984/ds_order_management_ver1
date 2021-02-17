class OrdersController < ApplicationController
  def index
    @order = Order.all
  end   
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to orders_path(@order)
    else  
      render :new
    end   
  end
  
  
  private
  def order_params
    params.require(:order).permit(:order_num, :purchase_num, :price).merge(user_id: current_user.id)
  end
  
end
