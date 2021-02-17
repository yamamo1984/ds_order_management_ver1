require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end 

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'email、password、passwordconfirmation、first_name、last_nameが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordとpassword_confirmationが６文字以上で英数字混在であれば登録できる' do
          @user.password = '000yyy'
          expect(@user).to be_valid
        end
        it 'first_nameが全角文字であれば登録できる' do
          @user.first_name = 'テスト'
          expect(@user).to be_valid
        end
        it 'last_nameが全角文字であれば登録できる' do
          @user.last_name = 'テスト'
          expect(@user).to be_valid
        end
      end 

      context '新規登録できないとき' do

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password can't be blank")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
        end
        it 'passwordとpassword_confirmationが英字だけでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password は英数字混合にして下さい")
        end
        it 'passwordとpassword_confirmationが数字だけでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password は英数字混合にして下さい")
        end
        it 'passwordが6文字以下では登録できない' do
          @user.password = 'aaa11'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
        end
        it 'emailが空だと登録できない'  do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Email can't be blank")
        end
        it '登録済みのemailと同じemailでは登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailカラムが＠を含まないと登録できない' do
          @user.email = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Email is invalid")
        end
        it 'passwordに全角文字が含まれていると登録できない' do
          @user.password = 'Ｔest111'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password は半角英数を使用してください")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name can't be blank")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name can't be blank")
        end  
        it 'first_nameが全角文字でなければ登録できない' do
          @user.first_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name は全角文字で入力してください")
        end
        it 'last_nameが全角文字でなければ登録できない' do
          @user.last_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name は全角文字で入力してください")
        end 
      end
    end          
end
