class OrdersController < ApplicationController


  def index
    #Groupメソッドで指定カラムの重複をまとめ
    #includesでN+1問題を解消
    @order = Order.group(:order_num).includes(:customer,:item) 
  end   
  
  def new
    @order = OrderShipAddress.new
  end

  def create
    @order = OrderShipAddress.new(order_params)
    @order.ship_save
    @ship_address_id = ShipAddress.last.id
     
    #eachメソッドで複数の配列を回すための記述
    order_params['item_id'].zip(order_params['purchase_num']).each do |i, p|
      @order = Order.new
      @order.order_num = order_params['order_num']
      @order.price = order_params['price']
      @order.customer_id = order_params['customer_id']
      @order.ship_address_id = @ship_address_id
      @order.purchase_num = p
      @order.user_id = order_params['user_id']
      @order.item_id = i
      @order.save
    end  
    if @order.save 
      redirect_to orders_path(@order)
    else  
      render :new
    end   
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params_for_edit)
     if order.save
      redirect_to order_path(order.order_num)
    else  
      render :edit
    end   
  end  

  def destroy
    @order = Order.find(params[:id])
      redirect_to order_path(@order.order_num) if @order.destroy
  end  

  def show
    @order = Order.where(order_num: params[:id]).includes(:customer, :item)
  end  
  
  private

  
  def order_params
    params.require(:order_ship_address).permit(:order_num, :price, :customer_id, :ship_address_num, :first_name, :last_name, :email, :company, :tel, :post_code, :place_id, :city, :street_num, :building, :memo, :ship_address_id).merge(user_id: current_user.id, ship_address_id: @ship_address_id, purchase_num: params[:purchase_nums], item_id: params[:item_ids])
  end

  #オーダーeditアクションにおいて、配送先などのパラメータを受け取らない場合に使用するメソッド
  def order_params_for_edit
    params.require(:order).permit(:order_num, :purchase_num, :item_id)
  end

  


  
end 
