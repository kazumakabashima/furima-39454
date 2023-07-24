require 'rails_helper'

RSpec.describe Item, type: :request do

  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do

    context '商品出品ができる時' do
      it '正常系' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'image: 必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("を入力してください")
      end
      it 'name: 必須' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '説明: 必須' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリー: 必須' do
        @item. category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'カテゴリー: 空白（１）' do
        @item. category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'ステータス: 必須' do
        @item. status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'ステータス: 空白（１）' do
        @item. status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料: 必須' do
        @item. burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '配送料: 空白（１）' do
        @item. burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '地域: 必須' do
        @item. prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '地域: 空白（１）' do
        @item. prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '日数: 必須' do
        @item. shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '日数: 空白（１）' do
        @item. shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '価格: 必須' do
        @item. price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格: 範囲,不足' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it '価格: 範囲,超過' do
        @item.price = 10000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it '価格: 全角'do
        @item.price = "１２３４"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '価格: 英字'do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '価格: 漢字'do
        @item.price = "試験"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '価格: カナ'do
        @item.price = "テスト"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '価格: ひらがな'do
        @item.price = "てすと"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '価格: 特殊記号'do
      @item.price = "$%^&*"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it "userが存在しなければ登録できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end

  end
end

