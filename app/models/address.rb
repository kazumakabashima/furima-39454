class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture (include ActiveHash::Associations, has_many :items, address)

  
  # 配送先の住所情報も購入の都度入力させること。
  # 郵便番号が必須であること。
  # 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
  # 都道府県が必須であること。
  # 市区町村が必須であること。
  # 番地が必須であること。
  # 建物名は任意であること。
  # 電話番号が必須であること。
  # 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。
end
