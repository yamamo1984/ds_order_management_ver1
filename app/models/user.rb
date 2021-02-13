class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
         with_options presence: true do
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英数字両方を含めてください' }     
      
          with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字で入力してください' } do
          validates :first_name
          validates :last_name
        end
    
        end 
  end

  has_many :orders 
  has_many :comments       
end
