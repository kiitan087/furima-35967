require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入機能' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Token can't be blank"
      end
      it 'zipが空だと保存できないこと' do
        @order_destination.zip = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Zip can't be blank"
      end
      it 'shipping_area_idが空だと登録できない' do
        @order_destination.shipping_area_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'shipping_area_idが1{--}だと登録できない' do
        @order_destination.shipping_area_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include 'Shipping area must be other than 1'
      end
      it 'cityが空だと保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "City can't be blank"
      end
      it 'blockが空だと保存できないこと' do
        @order_destination.block = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Block can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが半角数字以外だと保存できないこと' do
        @order_destination.phone_number = '数かずカズnumber'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phone number is invalid. Input half-width numeric characters(10 or 11 digits)."
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @order_destination.phone_number = "123456789"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phone number is invalid. Input half-width numeric characters(10 or 11 digits)."
      end

      it 'phone_numberが12桁以下だと保存できないこと' do
        @order_destination.phone_number = "123456789123"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phone number is invalid. Input half-width numeric characters(10 or 11 digits)."
      end
    end
  end
end
