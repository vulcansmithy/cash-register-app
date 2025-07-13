# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
products = [
  {
    code: 'GR1',
    name: 'Green Tea',
    price: BigDecimal('3.11')
  },
  {
    code: 'SR1',
    name: 'Strawberries',
    price: BigDecimal('5.00')
  },
  {
    code: 'CF1',
    name: 'Coffee',
    price: BigDecimal('11.23')
  }
]

Product.delete_all
products.each do |product|
  Product.create!(product)
end