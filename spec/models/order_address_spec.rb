require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user) 
      item = FactoryBot.create(:item) 
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end
    
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      
      it 'building_nameが空でも保存できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが正規表現でないと保存できない(文字列ではない)' do
        @order_address.postal_code = 111-2222
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postal_codeが正規表現でないと保存できない(前半が3桁ではない)' do
        @order_address.postal_code = 4444-4444
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postal_codeが正規表現でないと保存できない(後半が4桁ではない)' do
        @order_address.postal_code = 333-55555
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空だと保存できない' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが正規表現でないと保存できない(半角数字ではない)' do
        @order_address.phone_number = "０９０１１１１２２２２"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが正規表現でないと保存できない(10桁以下)' do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが正規表現でないと保存できない(12桁以下)' do
        @order_address.phone_number = "123456789123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'prefecture_idが空だと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end