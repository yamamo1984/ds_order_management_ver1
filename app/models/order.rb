class Order < ApplicationRecord

  belongs_to :user
  belongs_to :customer
  belongs_to :ship_address


end
