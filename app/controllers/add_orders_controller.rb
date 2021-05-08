class AddOrdersController < ApplicationController
  #既存配送先を持つ新規注文に対応するController
  def new
    @order = Order.new
    @items = Item.all
  end

  #パラメータに入っている配列の数に応じてレコードを繰り返す
  def create
    #eachメソッドで複数の配列を回すための記述
    order_params['item_id'].zip(order_params['purchase_num']).each do |i, p|
      @order = Order.new
      @order.order_num = order_params['order_num']
      @order.price = order_params['price']
      @order.customer_id = order_params['customer_id']
      @order.ship_address_id = order_params['ship_address_id']
      @order.purchase_num = p
      @order.user_id = order_params['user_id']
      @order.item_id = i
      if @order.save
        redirect_to orders_path(@order)
        
      else  
        render :new
      end   
    end  
  end

  def items_search
    return nil if params[:keyword] == ""
    @item = Item.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: @item }
  end
  
  private
  def order_params
    params.require(:order).permit(:order_num, :price, :customer_id, :ship_address_id, :name).merge(purchase_num: params[:purchase_nums],user_id: current_user.id, item_id: params[:item_ids])
  end
end
