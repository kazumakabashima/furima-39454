class Item < ApplicationRecord
  has_one_attached :image
  belongs_to       :user
  has_one          :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status 
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_day 

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :genre_id numericality: { other_than: 1 } 
end
