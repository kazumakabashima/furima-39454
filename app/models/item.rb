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
  validates :category_id     numericality: { other_than: 1 , message: "can't be blank" } 
  validates :status_id       numericality: { other_than: 1 , message: "can't be blank" } 
  validates :burden_id       numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id   numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_day_id numericality: { other_than: 1 , message: "can't be blank" } 
end
