FactoryBot.define do
  factory :order_address do
    postal_code { "111-1111" }
    city {"fukuoka"}
    block {"fukuoka"}
    phone_number {"09011112222"}
    prefecture_id{2}
  end
end