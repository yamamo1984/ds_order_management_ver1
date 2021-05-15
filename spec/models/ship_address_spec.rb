require 'rails_helper'

RSpec.describe ShipAddress, type: :model do
  before do
    @ship_address = FactoryBot.build(:ship_address)
  end  

  describe "配送先新規登録" do
    context "新規登録できる時" do
      it "必須項目が入力されていれば登録できる" do
        expect(@ship_address).to be_valid
      end
    end

    context "新規登録できない時" do
      it "姓が空では登録できない" do
        @ship_address.last_name = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Last nameを入力してください"
      end  
      it "名が空では登録できない" do
        @ship_address.first_name = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "First nameを入力してください"
      end 
      it "会社名が空では登録できない" do
        @ship_address.company = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Companyを入力してください"
      end 
      it "郵便番号が空では登録できない" do
        @ship_address.post_code = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Post codeを入力してください"
      end 
      it "都道府県が空では登録できない" do
        @ship_address.place_id = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Placeを選択してください"
      end 
      it "市町村が空では登録できない" do
        @ship_address.city = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Cityを入力してください"
      end 
      it "番地が空では登録できない" do
        @ship_address.street_num = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Street numを入力してください"
      end 
      it "電話番号が空では登録できない" do
        @ship_address.tel = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Telを入力してください"
      end
      it "Emailが空では登録できない" do
        @ship_address.email = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Emailを入力してください"
      end 
      it "Emailが全角文字では登録できない" do
        @ship_address.email = "TEST＠TEST.COM"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Emailは半角英数メールアドレス形式での入力必須です"
      end
      it "Emailは@が含まれたメールアドレス形式でないと登録できない" do
        @ship_address.email = "test.com"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Emailは半角英数メールアドレス形式での入力必須です"
      end
      it "郵便番号が全角数字では登録できない" do
        @ship_address.post_code = "１１１１１１１"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "郵便番号が7桁未満では登録できない" do
        @ship_address.post_code = "111111"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "郵便番号が8桁以上では登録できない" do
        @ship_address.post_code = "11111111"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "郵便番号にアルファベットがあると登録できない" do
        @ship_address.post_code = "111111A"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Post codeは半角数字７桁を使用してください"
      end
      it "電話番号が全角では登録できない" do
        @ship_address.tel = "０００１１１１１１１１"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "電話番号が12桁以上ではと登録できない" do
        @ship_address.tel = "000111111111"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "電話番号が10桁未満では登録できない" do
        @ship_address.tel = "000111111"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "電話番号がにアルファベットがあるとで登録できない" do
        @ship_address.tel = "0001111111A"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Telは半角数字電話番号形式で記入してください"
      end
      it "姓が全角でないと登録できない" do
        @ship_address.last_name = "test"
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "Last nameは全角文字を使用してください"
      end
      it "名が全角でないと登録できない" do
        @ship_address.first_name = ""
        @ship_address.valid?
        expect(@ship_address.errors.full_messages).to include "First nameは全角文字を使用してください"
      end
    end  
  end
end
