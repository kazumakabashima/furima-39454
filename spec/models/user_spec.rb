require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # nickname
    it 'nickname: 必須' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    # email
    it 'email: 必須' do
  
    end
    it 'email: 一意' do
    end
    it 'email: @, 必須' do
    end
    # password
    it 'password: 必須' do

    end
    it 'password: 6文字以上' do
    end
    it 'password: 半角英数' do
    end
    it 'password,password_confirmation: 一致' do
    end
    # name_kanji
    it 'first_name_kanji: 必須' do
    
    end
    it 'first_name_kanji: 全角' do
    end
    it 'last_name_kanji: 必須' do
    end
    it 'last_name_kanji: 全角' do
    end
    # name_kana
    it 'first_name_kana: 必須' do
    end
    it 'first_name_kana: 全角' do
    end
    it 'last_name_kana: 必須' do
    end
    it 'last_name_kana: 全角' do
    end
    # birth_day
    it 'last_name_kana: 必須' do
    end
    
  end
end
