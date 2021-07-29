FactoryBot.define do
    factory :user do
      name { Faker::Code.imei }
      username { Faker::Name.name }
      email { Faker::Internet.email }
      password { Faker::Internet.password(min_length: 6) }
    end
  end
  