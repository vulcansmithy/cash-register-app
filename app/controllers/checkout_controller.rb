class CheckoutController < ApplicationController
  def index
    @products = Product.all
    @cart_items = CartItem.all
    @subtotal = CartService.new.calculate_subtotal
    @total = CartService.new.calculate_total_with_discounts
puts "@DEBUG L:#{__LINE__}    @total=#{@total.format} #{@total} #{@total.class}"
  end

  def add
    CartService.new.add_item(params[:product_code])
    redirect_to root_path, notice: "Item added to cart"
  rescue ArgumentError => e
    redirect_to root_path, alert: e.message
  end

  def remove
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to root_path, notice: "Item removed from cart"
  end
end
