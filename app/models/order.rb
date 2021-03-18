class Order < ApplicationRecord

  belongs_to :user
  belongs_to :customer
  belongs_to :ship_address
  has_many :order_items
  has_many :items, through: :order_items
  



end
