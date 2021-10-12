require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報が保存' do
    context '商品が出品できる場合' do
      it '全ての情報が揃っている場合登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品のが出品できない場合' do
      it '商品画像を一枚つけるないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと保存できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が無いと保 存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状況の情報が無いと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品の負担の情報が無いと保存できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送地域の情報が無いと保存できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '発送までの日数の情報が無いと保存でき無い' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it '価格の情報が無いと保存できない' do
        @item.prise = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prise  is out of setting range')
      end
      it '価格は¥300以下の場合の数字を入力した場合保存されない' do
        @item.prise = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Prise  is out of setting range')
      end
      it '価格は、¥9999999以上の数字を入力した場合保存されない' do
        @item.prise = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Prise  is out of setting range')
      end
      it '価格は、半角数字値以外の数字を入力した場合保存されない' do
        @item.prise = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prise is invalid. Input half-width characters')
      end
      it 'user_idが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
