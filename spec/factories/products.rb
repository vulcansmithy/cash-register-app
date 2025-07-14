FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "PR#{n}" }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 1..100.0, as_string: true) }
    
    trait :green_tea do
      name { 'Green Tea' }
      code { 'GR1' }
      price { 3.11 }
    end
    
    trait :strawberry do
      name { 'Strawberry' }
      code { 'SR1' }
      price { 5.00 }
    end
    
    trait :coffee do
      name { 'Coffee' }
      code { 'CF1' }
      price { 11.23 }
    end
  end
end
