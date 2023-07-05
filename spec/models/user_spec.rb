require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '新規登録できる' do
    expect(@user).to be_valid
    end
    # nickname
    it 'nickname: 必須' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    # email
    it 'email: 必須' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'email: @, 必須' do
      @user.email = "test.mail.address"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    # password
    it 'password: 必須' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password: 6文字以上' do
      @user.password = 12345
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'password: 半角英数' do
      @user.password = "テスト"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'password,password_confirmation: 一致' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    # name_kanji
    it 'first_name_kanji: 必須' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it 'first_name_kanji: 全角' do
      @user.first_name_kanji = 'first_name_kanji_test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it 'last_name_kanji: 必須' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
    end
    it 'last_name_kanji: 全角' do
      @user.last_name_kanji = 'last_name_kanji_test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
    end
    # name_kana
    it 'first_name_kana: 必須' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'first_name_kana: 全角' do
      @user.first_name_kana = 'first_name_kana_test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'last_name_kana: 必須' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'last_name_kana: 全角' do
      @user.last_name_kana = 'last_name_kana_test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    # birth_day
    it 'birth_day: 必須' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    
  end
end
