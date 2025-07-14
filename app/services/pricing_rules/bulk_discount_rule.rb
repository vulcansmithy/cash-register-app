# app/services/pricing_rules/bulk_discount_rule.rb
module PricingRules
  class BulkDiscountRule < BaseRule
    def calculate_discount
      item_exist = eligible_items
      return 0 unless item_exist

      # only apply bulk discount of the strawwberry item is 3 or more
      return 0 unless item_exist.quantity >= 3

      # Calculate savings from reduced price
      original_total = item_exist.subtotal

      discounted_price = Money.new(450, "EUR")
      new_total = item_exist.quantity * discounted_price
      original_total - new_total
    end

    private

    def eligible_items
      @items.joins(:product).find_by(products: { code: "SR1" })
    end
  end
end
