class Product < ApplicationRecord
  has_many :cart_items
  
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
