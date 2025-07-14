class CartService
  attr_reader :cart_items

  def initialize
    @cart_items = []
  end

  def add_item(product_code)
    product = Product.find_by_code(product_code)
    raise ArgumentError, "Product not found" unless product

    existing_item = cart_items.find { |item| item.product.code == product_code }
    if existing_item
      update_quantity(existing_item)
    else
      add_new_item(product)
    end
  end

  def calculate_subtotal
    cart_items.sum(&:subtotal)
  end

  def calculate_total_with_discounts
    subtotal = calculate_subtotal
    discounts = calculate_all_discounts
    subtotal - discounts
  end

  private

  def update_quantity(item)
    item.quantity += 1
    item.subtotal = item.quantity * item.product.price
    item.save!
  end

  def add_new_item(product)
    CartItem.create!(
      product: product,
      quantity: 1,
      subtotal: product.price
    )
  end

  def calculate_all_discounts
    rules = [
      PricingRules::BogofRule.new(cart_items),
      PricingRules::BulkDiscountRule.new(cart_items),
      PricingRules::VolumeDiscountRule.new(cart_items)
    ]

    rules.sum(&:calculate_discount)
  end
end
