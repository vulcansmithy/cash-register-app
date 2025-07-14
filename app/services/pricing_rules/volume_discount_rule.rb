module PricingRules
  class VolumeDiscountRule < BaseRule
    def calculate_discount
      coffee_items = eligible_items
      return 0 unless coffee_items.size >= 3

      # Apply 2/3 price for all coffees
      original_total = coffee_items.sum(&:subtotal)
      two_thirds_price = coffee_items.first.product.price * Rational(2, 3)
      new_total = coffee_items.size * two_thirds_price
      original_total - new_total
    end

    private

    def eligible_items
      @items.select { |item| item.product.code == "CF1" }
    end
  end
end
