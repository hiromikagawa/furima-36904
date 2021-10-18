require 'rails_helper'

RSpec.describe CardDelivery, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 1
      @card_delivery = FactoryBot.build(:card_delivery, user_id: user.id, item_id: item.id)
    end
    describe '配送先の登録' do
      context '配送先の登録ができる' do
        it '全ての情報が揃っていれば、登録できる' do
          expect(@card_delivery).to be_valid
        end
        it '建物名がなくても他が揃っていれば登録できる' do
          @card_delivery.building_name = ''
          expect(@card_delivery).to be_valid
        end
      end
      context '配送先の登録が出来ない時' do
        it '郵便番号が無いと登録出来ない' do
          @card_delivery.post_code = ''
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("Post code can't be blank")
        end
        it '都道府県名が無いと登録出来ない' do
          @card_delivery.prefecture_id = ''
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が無いと登録出来ない' do
          @card_delivery.city = ''
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("City can't be blank")
        end
        it '番地が無いと登録出来ない' do
          @card_delivery.address = ''
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号が無いと登録出来ない' do
          @card_delivery.phone_number = ''
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("Phone number can't be blank")
        end
        it '郵便番号は、「3桁ハイフン4桁」で無いと登録出来ない事' do
          @card_delivery.phone_number = '0123456'
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号は、１０桁以上で無いと登録出来ない' do
          @card_delivery.phone_number = '012345679'
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号は、11桁以下で無いと登録出来ない' do
          @card_delivery.phone_number = '012345678910'
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include('Phone number is invalid')
        end
        it '電話番号は、半角数字以外は登録出来ない' do
          @card_delivery.phone_number = '０９０６２８８５３８９'
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include('Phone number is invalid')
        end
        it '郵便番号は、半角文字列しか登録出来ない' do
          @card_delivery.phone_number = '００１ー２３４５'
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include('Phone number is invalid')
        end
        it 'user_idが無いと登録できない' do
          @card_delivery.user_id = nil
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが無いと登録できない' do
          @card_delivery.item_id = nil
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("Item can't be blank")
        end
        it 'tokenが空では、登録できないこと' do
          @card_delivery.token = nil
          @card_delivery.valid?
          expect(@card_delivery.errors.full_messages).to include("Token can't be blank")
        end
        it '・都道府県に「---」が選択されている場合は購入できない'do
        @card_delivery.prefecture_id = 0
        @card_delivery.valid?
        expect(@card_delivery.errors.full_messages).to include("Prefecture can't be blank"
        end
      end
    end
  end
end
