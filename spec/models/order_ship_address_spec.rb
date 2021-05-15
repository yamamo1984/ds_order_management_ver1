require 'rails_helper'

RSpec.describe OrderShipAddress, type: :model do
  before do
    @order_ship_address = FactoryBot.build(:order_ship_address)
  end  

  describe "注文新規登録" do
    context "新規登録できる時" do
      it "必要情報が入力されていればでは登録できる" do
        expect(@order_ship_address).to be_valid
      end
    end
    context "新規登録できない時" do
      it "注文番号が空では登録できない" do
        @order_ship_address.order_num = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Order numを入力してください"
      end
      it "重複した注文番号では登録できない" do
        @order_ship_address.ship_save
        another_ship_address = FactoryBot.build(:order_ship_address)
        another_ship_address.order_num = @order_ship_address.order_num
        another_ship_address.valid?
        expect(another_order_ship_address.errors.full_messages).to include "Order numは既に登録してあります"
      end  
      it "商品が選択されていないと登録できない" do
        @order_ship_address.item_id = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Itemを選択してください"
      end
      it "購入者が選択されていないと登録できない" do
        @order_ship_address.customer_id = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Customerを選択してください"
      end
      
      it "配送先コードが空では登録できない" do
        @order_ship_address.ship_address_num = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Ship address numを入力してください"
      end
      it "重複した配送コードを入れても登録できない" do
        @order_ship_address.ship_save
        another_ship_address = FactoryBot.build(:order_ship_address)
        another_ship_address.ship_address_num = @order_ship_address.ship_address_num
        another_ship_address.valid?
        expect(another_ship_address.errors.full_messages).to include "Ship address numは既に登録してあります"
      end
      it "姓が空では登録できない" do
        @order_ship_address.last_name = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Last nameを入力してください"
      end  
      it "名が空では登録できない" do
        @order_ship_address.first_name = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "First nameを入力してください"
      end 
      it "会社名が空では登録できない" do
        @order_ship_address.company = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Companyを入力してください"
      end 
      it "郵便番号が空では登録できない" do
        @order_ship_address.post_code = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Post codeを入力してください"
      end 
      it "都道府県が空では登録できない" do
        @order_ship_address.place_id = 0
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Placeを選択してください"
      end 
      it "市町村が空では登録できない" do
        @order_ship_address.city = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Cityを入力してください"
      end 
      it "番地が空では登録できない" do
        @order_ship_address.street_num = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Street numを入力してください"
      end 
      it "電話番号が空では登録できない" do
        @order_ship_address.tel = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Telを入力してください"
      end
      it "Emailが空では登録できない" do
        @order_ship_address.email = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Emailを入力してください"
      end 
      it "Emailが全角文字では登録できない" do
        @order_ship_address.email = "TEST＠TEST.COM"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Emailは半角英数メールアドレス形式での入力必須です"
      end
      it "Emailは@が含まれたメールアドレス形式でないと登録できない" do
        @order_ship_address.email = "test.com"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Emailは半角英数メールアドレス形式での入力必須です"
      end
      it "郵便番号が全角数字では登録できない" do
        @order_ship_address.post_code = "１１１１１１１"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "郵便番号が7桁未満では登録できない" do
        @order_ship_address.post_code = "111111"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "郵便番号が8桁以上では登録できない" do
        @order_ship_address.post_code = "11111111"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "郵便番号にアルファベットがあると登録できない" do
        @order_ship_address.post_code = "111111A"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "電話番号が全角では登録できない" do
        @order_ship_address.tel = "０００１１１１１１１１"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "電話番号が12桁以上ではと登録できない" do
        @order_ship_address.tel = "000111111111"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "電話番号が10桁未満では登録できない" do
        @order_ship_address.tel = "000111111"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "電話番号がにアルファベットがあるとで登録できない" do
        @order_ship_address.tel = "0001111111A"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "姓が全角でないと登録できない" do
        @order_ship_address.last_name = "test"
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "Last nameは全角文字を使用してください"
      end
      it "名が全角でないと登録できない" do
        @order_ship_address.first_name = ""
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include "First nameは全角文字を使用してください"
      end
    end    
  end  
end
