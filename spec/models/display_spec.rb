require 'rails_helper'
RSpec.describe Display, type: :model do
  describe '#create' do
    before do
      @display = FactoryBot.build(:display)
    end
    context '出品に成功した時' do
      it '全てのカラムがあれば出品できること' do
        @display.valid?
        expect(@display).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it '商品画像が空では出品できない' do
        @display.image = nil
        @display.valid?
        expect(@display.errors.full_messages).to include
      end
      it '商品名が空では出品できない' do
        @display.product = ''
        @display.valid?
        expect(@display.errors.full_messages).to include("Product can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @display.product_text = ''
        @display.valid?
        expect(@display.errors.full_messages).to include("Product text can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @display.category_id = ''
        @display.valid?
        expect(@display.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが--では出品できない' do
        @display.category_id = 1
        @display.valid?
        expect(@display.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態についての情報が空では出品できない' do
        @display.product_status_id = ''
        @display.valid?
        expect(@display.errors.full_messages).to include("Product status can't be blank")
      end
      it '商品の状態についての情報が--では出品できない' do
        @display.product_status_id = 1
        @display.valid?
        expect(@display.errors.full_messages).to include('Product status must be other than 1')
      end
      it '配送料の負担についての情報が空では出品できない' do
        @display.delivery_price_id = ''
        @display.valid?
        expect(@display.errors.full_messages).to include("Delivery price can't be blank")
      end
      it '配送料の負担についての情報が--では出品できない' do
        @display.delivery_price_id = 1
        @display.valid?
        expect(@display.errors.full_messages).to include('Delivery price must be other than 1')
      end
      it '発送元の地域についての情報が空では出品できない' do
        @display.prefecture_id = ''
        @display.valid?
        expect(@display.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域についての情報が--では出品できない' do
        @display.prefecture_id = 1
        @display.valid?
        expect(@display.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数についての情報が空では出品できない' do
        @display.shipping_date_id = ''
        @display.valid?
        expect(@display.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '発送までの日数についての情報が--では出品できない' do
        @display.shipping_date_id = 1
        @display.valid?
        expect(@display.errors.full_messages).to include('Shipping date must be other than 1')
      end
      it '価格が空では出品できない' do
        @display.price = ''
        @display.valid?
        expect(@display.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が￥299以下の金額では出品できない' do
        @display.price = 299
        @display.valid?
        expect(@display.errors.full_messages).to include
      end
      it '価格が￥10,000,000以上の金額では出品できない' do
        @display.price = 10_000_000
        @display.valid?
        expect(@display.errors.full_messages).to include
      end
      it '価格が全角では出品できない' do
        @display.price = '３００'
        @display.valid?
        expect(@display.errors.full_messages).to include
      end
      it '価格が半角英数字混合では出品できない' do
        @display.price = '300aa'
        @display.valid?
        expect(@display.errors.full_messages).to include
      end
      it '価格が半角英語だけでは出品できない' do
        @display.price = 'abcdef'
        @display.valid?
        expect(@display.errors.full_messages).to include
      end
    end
  end
end
