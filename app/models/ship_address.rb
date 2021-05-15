class ShipAddress < ApplicationRecord
  validates :ship_address_num, presence: true
  validates :ship_address_num, uniqueness: { message: "は既に登録してあります" }
  
  has_many :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
    with_options presence: true do
      validates :ship_address_num, format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'は半角英数を使用してください' } 
      validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々０-９]+\z/, message: 'は全角文字を使用してください' } 
      validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々０-９]+\z/, message: 'は全角文字を使用してください' } 
      validates :email, format: { with: /\A\S+@\S+\.\S+\z/, message: 'は半角英数メールアドレス形式での入力必須です' }  
      validates :post_code, format: { with: /\A\d{7}\z/, message: 'は半角数字７桁を使用してください' }   
      validates :place_id, numericality: { other_than: 0, message: "を選択してください"}
      validates :tel, format: { with: /\A\d{10,11}\z/ , message: 'は半角数字電話番号形式で記入してください' } 
      validates :company
      validates :city
      validates :street_num
    end
  
end
