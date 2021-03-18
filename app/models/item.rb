class Item < ApplicationRecord
  with_options presence: true do
    validates :code, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数を使用してください' } 
    validates :name
    validates :price
    validates :color
    validates :size
    validates :stock_num
  end
    has_many :order_items
    has_many :orders, through: :order_items

    def formatted_name
      "#{name} | #{color} | #{size} "
    end  
end
