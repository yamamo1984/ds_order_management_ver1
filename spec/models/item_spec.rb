require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end  

  describe "商品新規登録" do
    context "新規登録できる時" do
      it "商品コード・商品名・単価・在庫が入力されていればでは登録できる" do
        expect(@item).to be_valid
      end
    end

    context "新規登録できない時" do
      it "商品コードが空では登録できない" do
        @item.code = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Code can't be blank"
      end  
      it "商品名が空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end 
      it "商品価格が空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end 
      it "商品在庫が空では登録できない" do
        @item.stock_num = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Stock num can't be blank"
      end 
      it "商品コードが全角では登録できない" do
        @item.code = "０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Code は半角英数を使用してください"
      end 
      it "商品価格が全角では登録できない" do
        @item.price = "０"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は半角数字を使用してください"
      end 
      it "商品価格に文字があると登録できない" do
        @item.price = "1h"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は半角数字を使用してください"
      end 
      it "商品在庫が全角では登録できない" do
        @item.stock_num = "０"
        @item.valid?
        expect(@item.errors.full_messages).to include "Stock num は半角数字を使用してください"
      end
      it "商品在庫に文字があると登録できない" do
        @item.stock_num = "1h"
        @item.valid?
        expect(@item.errors.full_messages).to include "Stock num は半角数字を使用してください"
      end 
    end  
  end
end
