FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "PR#{n}" }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 1..100.0, as_string: true) }
  end
end
