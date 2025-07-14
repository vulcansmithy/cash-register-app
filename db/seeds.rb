products = [
  {
    code: 'GR1',
    name: 'Green Tea',
    price: Money.new(311, 'EUR')
  },
  {
    code: 'SR1',
    name: 'Strawberries',
    price: Money.new(500, 'EUR')
  },
  {
    code: 'CF1',
    name: 'Coffee',
    price: Money.new(1123, 'EUR')
  }
]

Product.delete_all
products.each do |product|
  Product.create!(product)
end
