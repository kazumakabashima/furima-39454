FactoryBot.define do
  factory :item do
    image           { "テストイメージ" }
    name            { Faker::Name.initials(number:2)}
    description     { Faker::Lorem.sentence }
    category_id     { Faker::Number.number }
    status_id       { Faker::Number.number }
    burden_id       { Faker::Number.number }
    prefecture_id   { Faker::Number.number }
    shipping_day_id { Faker::Number.number }
    price           { Faker::Number.number }
    user_id         { Faker::Number.number }
  end
end
