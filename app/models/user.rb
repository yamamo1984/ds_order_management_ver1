class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         validates :name, presence: true
  has_many :orders 
  has_many :comments       
end
