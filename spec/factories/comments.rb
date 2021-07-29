FactoryBot.define do
  factory :comment do
    comment { Faker::Alphanumeric.alphanumeric(number: 22) }
  end
end
