FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id{2}
    status_id{2}
    postage_id{2}
    region_id{2}
    day_id{2}
    prise {2000}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
