class Order < ApplicationRecord

  with_options presence: true do
    validates :order_num, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数を使用してください' } 
    validates :purchase_num
    validates :price
  end

 

  belongs_to :user
  belongs_to :customer


end
