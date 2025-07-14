module PricingRules
  class VolumeDiscountRule < BaseRule
    def calculate_discount

      coffee_items = eligible_items
      return 0 if coffee_items.empty?
      
      return 0 unless coffee_items.first.quantity >= 3

      # reduce the price by 2/3 if the order coffee item  is more than or equal to 3
      original_total = coffee_items.first.subtotal

      two_thirds_price = (BigDecimal('2') / BigDecimal('3')) * coffee_items.first.product.price 

      new_total = coffee_items.first.quantity * two_thirds_price
      
      original_total - new_total
    end

    private

    def eligible_items
      @items.joins(:product).where(products: { code: "CF1" })
    end
  end
end
