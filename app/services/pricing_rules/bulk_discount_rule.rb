# app/services/pricing_rules/bulk_discount_rule.rb
module PricingRules
  class BulkDiscountRule < BaseRule
    def calculate_discount
      strawberry_items = eligible_items
      
      return 0 if  strawberry_items.empty?

      return 0 unless strawberry_items.first.quantity >= 3

      # Calculate savings from reduced price
      original_total = strawberry_items.first.subtotal
      discounted_price = BigDecimal("4.50")
      new_total = strawberry_items.first.quantity * discounted_price
      original_total - new_total
    end

    private

    def eligible_items
      @items.joins(:product).where(products: { code: "SR1" })
    end
  end
end
