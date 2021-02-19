class OrderShipAddress

  include ActiveModel::Model
  attr_accessor :order_num, :price, :user_id, :customer_id,:purchase_num, :first_name, :last_name, :company, :tel, :post_code, :place_id, :city, :street_num, :building, :memo

  # オーダーモデルのバリデーション
  with_options presence: true do
    validates :order_num, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数を使用してください' } 
    validates :purchase_num
    validates :price
  end

  #配送先モデルのバリデーション
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英数字混合にして下さい' }     
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数を使用してください' }    
    validates :first_name
    validates :last_name
  end

  def save
    # 注文情報を保存し、orderという変数に格納
    order = Order.create(order_num: order_num, purchase_num: purchase_num, price: price, user_id: user_id, customer_id: customer_id)
    # 住所の情報を保存
    ShipAddress.create(first_name: first_name, last_name: last_name, company: company, tel: tel, post_code: post_code, place_id: place_id, city: city, street_num: street_num, building: building, memo: memo, customer_id: customer_id, order_id: order.id)
  end
end