require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user) # ユーザーを作成
      item = FactoryBot.create(:item, user: user) 
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
        expect(@order_address.errors.full_messages).to include("postal_code can't be blank")
      end
    end
  end
end

# with_options presence: :true 
#   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
#   validates :city 
#   validates :block
#   validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width characters."}
#   validates :item_id
#   validates :user_id

# validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank" } 