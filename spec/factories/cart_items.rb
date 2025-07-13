FactoryBot.define do
  factory :cart_item do
    product { nil }
    quantity { 1 }
    subtotal { "9.99" }
  end
end
