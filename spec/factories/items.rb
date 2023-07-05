FactoryBot.define do
  factory :item do
    image           { "テストイメージ" }
    name            { Faker::Name.initials(number:2)}
    description     { "テストテキスト"}
    category_id     { 1 }
    status_id       { 1 }
    burden_id       { 1 }
    prefecture_id   { 1 }
    shipping_day_id { 1 }
    price           { 500 }
    user_id         { 1 }
  end
end
