require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context 'ユーザー登録ができる時' do
      it '新規登録できる' do
        expect(@user).to be_valid
        end
    end

    context 'ユーザー登録ができない時' do
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
      it 'email: 重複' do
        existing_user = FactoryBot.create(:user, email: 'existing@example.com')
        @user.email = 'existing@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
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
      it 'password: 英字のみ' do
        @user.password = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password: 数字のみ' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password: 全角' do
        @user.password = "ｔｅｓｕｔｏ"
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
end
