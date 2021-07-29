FactoryBot.define do
  factory :rating do
    rate {  Faker::Alphanumeric.alphanumeric(number: 3.5) }
    location
    user
  end
end
