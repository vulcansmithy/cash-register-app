class Product < ApplicationRecord
  has_many :cart_items

  monetize :price_cents

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: Money.new(0, "EUR").amount }


  def self.find_by_code(code)
    find_by(code: code)
  end

  def price_in_cents
    price.cents
  end

  def formatted_price
    price.format
  end
end
