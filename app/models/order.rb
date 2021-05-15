class Order < ApplicationRecord
  validates :order_num, uniqueness: { message: "は既に登録してあります" }  
  belongs_to :user
  belongs_to :customer
  belongs_to :ship_address
  belongs_to :item
end

