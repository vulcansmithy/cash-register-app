module PricingRules
  class BogofRule < BaseRule
    def calculate_discount
      item_exist = eligible_items
      return 0 unless item_exist

      # Count pairs of Green Tea items
      item_count = item_exist.quantity
      pairs = item_count / 2

      # Each pair gives one free item
      result = item_exist.product.price * pairs
      result
    end

    private

    def eligible_items
      @items.joins(:product).find_by(products: { code: "GR1" })
    end
  end
end
