require 'rails_helper'

RSpec.describe Item, type: :request do
  
  describe '商品出品機能' do

    context '商品出品ができる時' do
      it '正常系' do
      end
    end

    context '商品出品ができない時' do
      it 'image: 必須' do
      end
      it 'name: 必須' do
      end
      it '説明: 必須' do
      end
      it 'カテゴリー: 必須' do
      end
      it 'ステータス: 必須' do
      end
      it '配送料: 必須' do
      end
      it '地域: 必須' do
      end
      it '日数: 必須' do
      end
      it '価格: 必須' do
      end
      it '価格: 範囲' do
      end
      it '価格: 全角'do
      end
      it '価格: 英字'do
      end
      it '価格: 漢字'do
      end
      it '価格: カナ'do
      end
      it '価格: ひらがな'do
      end
      it '価格: 特殊記号'do
      end
    end

  end
end

