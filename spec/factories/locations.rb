FactoryBot.define do
  factory :location do
    user
    name { Faker::Alphanumeric.alphanumeric(number: 22) }
    postal_code  { Faker::Alphanumeric.alphanumeric(number: 8) }
    number { Faker::Address.building_number }
    city { Faker::Address.city }
    address { Faker::Address.full_address }
    country { Faker::Address.country }
    country_code { Faker::Address.country_code }
    state { Faker::Address.state }
    state_code { Faker::Address.state_abbr }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude  }
  end
end
