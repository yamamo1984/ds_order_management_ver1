class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  has_many :comments
  has_many :order_items
  has_many :items, through: :order_items


  validates :order_num, presence: true
  validates :item_code, presence: true
  validates :purchase_num, presence: true
  validates :item_code, presence: true
  validates :price_one, presence: true
  
end
