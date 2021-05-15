class OrderShipAddress

  include ActiveModel::Model
  attr_accessor :ship_address_num, :order_num, :price, :user_id, :customer_id,:purchase_num, :first_name, :last_name, :company, :email, :tel, :post_code, :place_id, :city, :street_num, :building, :memo, :ship_address_id, :item_id

  # オーダーモデルのバリデーション
  with_options presence: true do
    validates :order_num, format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'は半角英数を使用してください' } 
    validates :item_id, numericality: { other_than: 0, message: "を選択してください"}
    # validates :order_num, uniqueness: { message: "は既に登録してあります" } Orderモデルの元の方に記載している。動作不良原因不明
    validates :customer_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :purchase_num, numericality: {only_integer: true, message: "は半角数字を使用してください"}
    validates :price, numericality: {only_integer: true, message: "は半角数字を使用してください"}
  end

  #配送先モデルのバリデーション
  with_options presence: true do
    validates :ship_address_num, format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'は半角英数を使用してください' } 
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々０-９]+\z/, message: 'は全角文字を使用してください' } 
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々０-９]+\z/, message: 'は全角文字を使用してください' } 
    validates :post_code, format: { with: /\A\d{7}\z/, message: 'は半角数字７桁を使用してください' }   
    validates :place_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :tel, format: { with: /\A\d{10,11}\z/ , message: 'は半角数字電話番号形式で記入してください' } 
    validates :company
    validates :city
    validates :street_num

  end

  def ship_save  
  # 住所の情報を保存
  ShipAddress.create(ship_address_num: ship_address_num, first_name: first_name, last_name: last_name, company: company, email: email, tel: tel, post_code: post_code, place_id: place_id, city: city, street_num: street_num, building: building, memo: memo, customer_id: customer_id)
  end
end