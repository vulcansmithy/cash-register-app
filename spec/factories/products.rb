FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "PR#{n}" }
    name { Faker::Commerce.product_name }
    price { Money.new(Faker::Commerce.price(range: 1..100.00).to_f * 100, 'EUR') }

    trait :green_tea do
      name { 'Green Tea' }
      code { 'GR1' }
      price { Money.new(311, 'EUR') }
    end

    trait :strawberry do
      name { 'Strawberry' }
      code { 'SR1' }
      price { Money.new(500, 'EUR') }
    end

    trait :coffee do
      name { 'Coffee' }
      code { 'CF1' }
      price { Money.new(1123, 'EUR') }
    end
  end
end
