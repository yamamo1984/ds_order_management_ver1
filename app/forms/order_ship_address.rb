class OrderShipAddress

  include ActiveModel::Model
  attr_accessor :ship_address_num, :order_num, :price, :user_id, :customer_id,:purchase_num, :first_name, :last_name, :company, :email, :tel, :post_code, :place_id, :city, :street_num, :building, :memo, :ship_address_id

  # オーダーモデルのバリデーション
  with_options presence: true do
    validates :order_num, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数を使用してください' } 
    validates :purchase_num
    validates :price
  end

  #配送先モデルのバリデーション
  with_options presence: true do
    validates :first_name
    validates :last_name
  end

  def save
   
    # 住所の情報を保存
    ShipAddress.create(ship_address_num: ship_address_num, first_name: first_name, last_name: last_name, company: company, email: email, tel: tel, post_code: post_code, place_id: place_id, city: city, street_num: street_num, building: building, memo: memo, customer_id: customer_id)

    @ship_address_id = ShipAddress.last.id
    # 注文情報を保存し、orderという変数に格納
    order = Order.create(order_num: order_num, purchase_num: purchase_num, price: price, user_id: user_id, customer_id: customer_id, ship_address_id: @ship_address_id)
  end
end