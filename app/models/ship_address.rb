class ShipAddress < ApplicationRecord
  has_many :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
  
end
