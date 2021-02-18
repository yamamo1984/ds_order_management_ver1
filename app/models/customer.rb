class Customer < ApplicationRecord
   with_options presence: true do
    validates :email
    validates :post_code, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数を使用してください' }   
    validates :tel, format: { with: /\A[0-9]+\z/, message: 'は半角文字を使用してください' } 
    validates :city
    validates :street_num
   end

  

 
 


    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :place

     #ジャンルの選択が「--」の時は保存できないようにする
    validates :place_id, numericality: { other_than: 0 } 

    has_many :orders
end
