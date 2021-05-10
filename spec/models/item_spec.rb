require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品新規登録" do
    it "商品コードが空では登録できない" do
      item = Item.new(code: "", )
    end  
    it "商品名が空では登録できない" do
    end 
    it "商品が空では登録できない" do
    end 
    it "商品コードが空では登録できない" do
    end 
    it "商品コードが空では登録できない" do
    end 
  end
end
