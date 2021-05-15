class Customer < ApplicationRecord
    with_options presence: true do
      validates :email, format: { with: /\A\S+@\S+\.\S+\z/, message: 'は半角英数メールアドレス形式での入力必須です' }  
      validates :post_code, format: { with: /\A\d{7}\z/, message: 'は半角数字７桁を使用してください' }   
      validates :tel, format: { with: /\A\d{10,11}\z/ , message: 'は半角数字電話番号形式で記入してください' } 
      validates :company
      validates :city
      validates :street_num
      validates :first_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々０-９]+\z/, message: 'は全角文字を使用してください' } 
      validates :last_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々０-９]+\z/, message: 'は全角文字を使用してください' } 
    end

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :place

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :place_id, numericality: { other_than: 0, message: "を選択してください"}

    has_many :orders
    has_many :ship_addresses, dependent: :destroy
end
