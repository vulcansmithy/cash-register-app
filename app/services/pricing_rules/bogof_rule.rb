module PricingRules
  class BogofRule < BaseRule
    def calculate_discount
      return 0 unless eligible_items.any?

      # Count pairs of Green Tea items
      item_count = eligible_items.first.quantity
      pairs = item_count / 2

      # Each pair gives one free item
      eligible_items.first.product.price * pairs
    end

    private

    def eligible_items
      # @items.select { |item| item.product.code == "GR1" }
      @items.joins(:product).where(products: { code: "GR1" })
    end
  end
end
