class Customer < ApplicationRecord
  has_many :orders
  has_one :send_address



  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true

end
