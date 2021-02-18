class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :show]

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
    params.require(:order).permit(:order_num, :purchase_num, :price).merge(user_id: current_user.id)
  end

  def set_order
    @order = Order.find(params[:id])
  end  

  
end
