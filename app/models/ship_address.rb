class ShipAddress < ApplicationRecord
  validates :ship_address_num, uniqueness: { message: "は既に登録してあります" }
  
  has_many :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
  
end
