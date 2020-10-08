FactoryBot.define do
  factory :purchace_address do
    user_id { Faker::Number.between(from: 1, to: 100) }
    item_id { Faker::Number.between(from: 1, to: 1000) }
    postal_code {'123-4567'}
    state_id { Faker::Number.between(from: 1, to: 47) }
    city { '大阪府' }
    address_line { '大阪市' }
    building { '通天閣' }
    telephone { Faker::Number.between(from: 0_000_0000_000, to: 99_999_999_999)}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
