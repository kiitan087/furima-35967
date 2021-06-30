require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '出品がうまくいくとき' do
      it 'image,product,product_description,category_id,status_id,delivery_change_id,shipping_area_id,delivery_time_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字だと登録できる' do
        @item.price = '500'
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'productが空だと登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product can't be blank"
      end
      it 'product_descriptionが空だと登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが1{--}だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'status_idが空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'status_idが1{--}だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it 'delivery_change_idが空だと登録できない' do
        @item.delivery_change_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery change can't be blank"
      end
      it 'delivery_change_idが1{--}だと登録できない' do
        @item.delivery_change_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery change must be other than 1"
      end
      it 'shipping_area_idが空だと登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'shipping_area_idが1{--}だと登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area must be other than 1"
      end
      it 'delivery_time_idが空だと登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery time can't be blank"
      end
      it 'delivery_time_idが1{--}だと登録できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery time must be other than 1"
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円より下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが9999999円より上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width numeric characters.'
      end
      it 'priceが英字(全角・半角)だと登録できない' do
        @item.price = 'AAAaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width numeric characters.'
      end
      it 'priceが漢字・ひらがな・カタカナだと登録できない' do
        @item.price = '漢字かなカナ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width numeric characters.'
      end
    end
  end
end
