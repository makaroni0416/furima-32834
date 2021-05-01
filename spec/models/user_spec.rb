require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまくいくとき' do
      it 'パスワードが6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        @user.valid?
        expect(@user).to be_valid
      end
      it '全てのカラムがあれば登録できること' do
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには「@」を含めないと登録できないこと' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが5文字以下であれば登録できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが確認パスワードと不一致では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa001'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは英数字混合での入力が無いと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは半角数字のみの入力で登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは全角での入力では登録できない' do
        @user.password = 'aaa1１１１'
        @user.password_confirmation = 'aaa1１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが全角以外では登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角以外では登録できない' do
        @user.family_name = 'takayuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'family_name_kanaが半角では登録できない' do
        @user.family_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana 全角カタカナ文字を使用してください')
      end
      it 'family_name_kanaがカタカナ以外の全角文字では登録できない' do
        @user.family_name_kana = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana 全角カタカナ文字を使用してください')
      end
      it 'first_name_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナ文字を使用してください')
      end
      it 'first_name_name_kanaがカタカナ以外の全角文字では登録できない' do
        @user.first_name_kana = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナ文字を使用してください')
      end
    end
  end
end
