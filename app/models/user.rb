class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
        with_options presence: true do
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英数字混合にして下さい' }     
          validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数を使用してください' }    
          validates :first_name
          validates :last_name
        end
        with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字で入力してください' } do
          validates :first_name
          validates :last_name
        end
     


  has_many :orders 
  has_many :comments       
end
