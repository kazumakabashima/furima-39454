class Item < ApplicationRecord
  has_one_attached :image
  belongs_to       :user
  has_one          :order

  validates :image,       presence: true
  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status 
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_day 

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id,     numericality: { other_than: 1 , message: "を入力してください" } 
  validates :status_id,       numericality: { other_than: 1 , message: "を入力してください" } 
  validates :burden_id,       numericality: { other_than: 1 , message: "を入力してください" } 
  validates :prefecture_id,   numericality: { other_than: 1 , message: "を入力してください" } 
  validates :shipping_day_id, numericality: { other_than: 1 , message: "を入力してください" } 

end
