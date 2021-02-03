class Order < ApplicationRecord
  belongs_to :user

  validates :order_num, presence: true
  validates :item_code, presence: true
  validates :purchase_num, presence: true
  validates :item_code, presence: true
  validates :price_one, presence: true
  
end
