require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it  'メールアドレスは、@を含む必要があること' do
     @user.email = 'aa'
     @user.valid?
     expect(@user.errors.full_messages).to include("Email is invalid")
   end
 
   it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
    @user.first_name = ''
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")

    end

   it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.first_name = 'aa'
    @user.last_name = 'aa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end

   it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
    @user.kana_first_name = ''
    @user.kana_last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width characters.")
    end
  
 
   it' ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
    @user.kana_first_name = 'kk'
    @user.kana_last_name = 'll'
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width characters.")
    end

   it'生年月日が必須であること' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  

  end
end