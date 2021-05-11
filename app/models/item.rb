class Item < ApplicationRecord
  with_options presence: true do
    validates :code, format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'は半角英数を使用してください' } 
    validates :code, uniqueness: { message: "は既に登録してあります"}
    validates :name
    validates :price, numericality: {only_integer: true, message: "は半角数字を使用してください"}
    validates :stock_num, numericality: {only_integer: true, message: "は半角数字を使用してください"}
  end  
  
  has_many :orders

  def formatted_name
    "#{name} | #{color} | #{size} "
  end  

  end   