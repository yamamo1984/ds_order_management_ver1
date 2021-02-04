class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end   

  def new
    @order = Order.new
  end  

  def create
    @order = Order.new(order_params)
    @order.save
    #<% データベースに保存されなかったら入力画面に戻る 成功したらトップに戻る # 
    if @order.save
       redirect_to root_path

    else
      render :new
    end   

  end  

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end 
  
  def order_params
    params.require(:order).permit(:order_num, :item_code, :purchase_num, :price_one, :purchase_memo).merge(user_id: current_user.id)
  end

end
