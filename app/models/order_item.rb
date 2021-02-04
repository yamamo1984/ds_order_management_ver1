class OrderItem < ApplicationRecord
   belongs_to :order
   belong_to :item

end
