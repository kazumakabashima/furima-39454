class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city,:block, :building_name, :phone_number, :order_id, :item_id, :user_id, :token
  with_options presence: :true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は不正な値です"}
    validates :city 
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は不正な値です"}
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :prefecture_id,   numericality: { other_than: 1 , message: "を入力してください" } 


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
