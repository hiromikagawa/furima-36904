FactoryBot.define do
  factory :user do
    nickname { 'Test' }
    email { Faker::Internet.free_email }
    password { 'k1234567' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'カタカナ' }
    first_name_kana { 'カタカナ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
