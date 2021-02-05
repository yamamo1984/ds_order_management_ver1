class Customer < ApplicationRecord
  has_many :orders
  has_one :send_address



  validates :name, presence: true
  validates :email, presence: true
  validates :post_code_1, presence: true
  validates :post_code_2, presence: true
  validates :prefecture, presence: true
  validates :address_1, presence: true
  validates :address_2, presence: true
  validates :email, presence: true
  validates :tel_num, presence: true

end
