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
end
