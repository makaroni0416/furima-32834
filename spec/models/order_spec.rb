require 'rails_helper'

RSpec.describe Order, type: :model do
  before do

    @user = FactoryBot.create(:user)
    @display = FactoryBot.create(:display)
    @order = FactoryBot.build(:order, user_id: @user.id, display_id: @display.id)
  end

  context '購入に成功した時' do
    it '全ての値があれば保存ができること' do
      expect(@order).to be_valid
    end
    it '建物名は空でも保存できること' do
      @order.building = ''
      expect(@order).to be_valid
    end
  end

  context '購入に失敗した時' do
    it 'tokenが空では登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では登録できないこと' do
      @order.postcode = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postcode can't be blank")
    end
    it '郵便番号が半角ハイフンを含んだ正しい形式以外では登録できないこと' do
      @order.postcode = '0123ー456'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
    end
    it '都道府県を正しく選択していないと登録できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村が空では登録できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では登録できないこと' do
      @order.block = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Block can't be blank")
    end
    it '市区町村が空では登録できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '電話番号が空では登録できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank", 'Phone number 半角数字のみ入力してください')
    end
    it '電話番号はハイフンがあると登録できないこと' do
      @order.phone_number = '090-8080-8080'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number 半角数字のみ入力してください')
    end
    it '電話番号は英数混合だと登録できないこと' do
      @order.phone_number = 'abc12345678'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number 半角数字のみ入力してください')
    end
    it '電話番号は11桁以上だと登録できないこと' do
      @order.phone_number = '123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number 半角数字のみ入力してください')
    end
    it 'user_idがあると登録できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'display_idがあると登録できないこと' do
      @order.display_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Display can't be blank")
    end
  end
end
