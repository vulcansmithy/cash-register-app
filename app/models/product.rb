class Product < ApplicationRecord
  has_many :cart_items

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def self.find_by_code(code)
    find_by(code: code)
  end
end
