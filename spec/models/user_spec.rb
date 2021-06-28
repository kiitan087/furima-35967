require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail,password,password_cofirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すレバ登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'emailに@があれば登録できる' do
        @user.email = 'aaa@aaa.com'
        expect(@user).to be_valid
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.last_name = '花子'
        expect(@user).to be_valid
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.first_name = '佐藤'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角(カタカナ)であれば登録できる' do
        @user.last_name = 'ハナコ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角(カタカナ)であれば登録できる' do
        @user.last_name = 'サトウ'
        expect(@user).to be_valid
      end
      it 'birthdayがあれば登録できる' do
        @user.birthday = '1930-01-01'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'example.example'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid. Input '@' character."
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '11aaa'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width alphanumeric mixed characters.'
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width alphanumeric mixed characters.'
      end
      it 'passwordが全角だと登録できない' do
        @user.password = '111AAA'
        @user.password_confirmation = '111AAA'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width alphanumeric mixed characters.'
      end
      it 'password_confilmationがpasswordと一致しないと登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '123bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが漢字でないと登録できない' do
        @user.last_name = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが漢字でないと登録できない' do
        @user.first_name = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaがカナでないと登録できない' do
        @user.last_name_kana = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid. Input full-width katakana characters.'
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaがカナでないと登録できない' do
        @user.first_name_kana = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters.'
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
