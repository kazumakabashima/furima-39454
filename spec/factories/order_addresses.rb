FactoryBot.define do
  factory :order_address do
    postal_code { "111-1111" }
    city {"fukuoka"}
    block {"fukuoka"}
    building_name {"自宅マンション"}
    phone_number {"09011112222"}
    prefecture_id{2}
    token {"tok_abcdefghijk00000000000000000"}
  end
end