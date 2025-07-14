module PricingRules
  class VolumeDiscountRule < BaseRule
    def calculate_discount
      searched_item = eligible_items
      return 0 unless searched_item

      return 0 unless searched_item.quantity >= 3

      # reduce the price by 2/3 if the order coffee item  is more than or equal to 3
      original_total = searched_item.subtotal

      # compute the 2/3 of the price of product price
      two_thirds_price = (BigDecimal("2") / BigDecimal("3")) * searched_item.product.price

      # compute the new total
      new_total = searched_item.quantity * two_thirds_price

      original_total - new_total
    end

    private

    def eligible_items
      @items.joins(:product).find_by(products: { code: "CF1" })
    end
  end
end
