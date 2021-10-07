require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '新規登録情報が全て揃っている場合' do
        expect(@user).to be_valid
      end
      it 'passwordが６桁以上であれば登録できる' do
        @user.password = 'k123456'
        @user.password_confirmation = 'k123456'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができてない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'fast_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが6文字以下であれば登録できない' do
        @user.password = 'k1234'
        @user.password_confirmation = 'k1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'k123456'
        @user.password_confirmation = 'k234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角でないと登録できない' do
        @user.password = 'K１２３４５６'
        @user.password_confirmation = 'K１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. ilude both letters and numbers')
      end
      it 'passwordが英数混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. ilude both letters and numbers')
      end
      it 'last_nameが全角でないと登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is input full-width characters')
      end
      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is input full-width characters')
      end
      it 'last_name_kanaが全角でないと登録できない' do
        @user.last_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid.input full-width katakana characters')
      end
      it 'first_name_kanaが全角でないと登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid.input full-width katakana characters')
      end
      it 'last_nameが、漢字・ひらがな・カタカナでないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is input full-width characters')
      end
      it 'first_nemamが、漢字・ひらがな・カタカナでないと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is input full-width characters')
      end
      it 'last_name_kanaが、カタカナでないと登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid.input full-width katakana characters')
      end
      it 'filst_name_kanaが、カタカナでないと登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid.input full-width katakana characters')
      end
      it '重複したemailが存在する場合登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end
