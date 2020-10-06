FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10)}
    status_id { Faker::Number.between(from: 1, to: 6)}
    postage_user_id { Faker::Number.between(from: 1, to: 3)}
    state_id { Faker::Number.between(from: 1, to: 47)}
    shipping_date_id { Faker::Number.between(from: 1, to: 3)}
    price { Faker::Number.between(from: 300, to: 9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
