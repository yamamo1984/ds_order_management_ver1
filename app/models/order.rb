class Order < ApplicationRecord

  belongs_to :user
  belongs_to :customer
  has_one :ship_address, dependent: :destroy


end
