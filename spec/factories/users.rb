FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2)}
    email                 { Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kanji      { "単体" }
    last_name_kanji       { "試験" }
    first_name_kana       { "タンタイ" }
    last_name_kana        { "シケン" }
    birth_day             { 1997/10/28 }
  end
end