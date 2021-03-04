class AddOrdersController < ApplicationController
  #既存配送先を持つ新規注文に対応するController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save 
      redirect_to orders_path(@order)
    else  
      render :new
    end   
  end
  
  private
  def order_params
    params.require(:order).permit(:order_num, :purchase_num, :price, :customer_id,:ship_address_id).merge(user_id: current_user.id)
  end
end
