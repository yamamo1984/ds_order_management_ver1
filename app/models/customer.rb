class Customer < ApplicationRecord
  has_many :order



  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true

end
