class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture (include ActiveHash::Associations, has_many :items, address)

  with_options presence :true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city 
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width characters."},
  end

  validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank" } 
end
