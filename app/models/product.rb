class Product < ApplicationRecord
  monetize :price_cents

  has_many :cart_items

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: Money.new(0, "EUR") }


  def self.find_by_code(code)
    find_by(code: code)
  end

  # Helper methods for money operations
  def price=(amount)
    super(Money.new(amount.to_f * 100, "GBP"))
  end

  def price_in_cents
    price.cents
  end

  def formatted_price
    price.format
  end
end
