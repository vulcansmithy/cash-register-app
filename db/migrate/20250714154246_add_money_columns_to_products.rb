class AddMoneyColumnsToProducts < ActiveRecord::Migration[7.2]
  def up
    # Add money columns with currency type
    add_column :products, :price_cents, :integer
    add_column :products, :price_currency, :string

    # Convert existing prices to money format
    Product.find_each do |product|
      price = Money.new((product.price * 100).round, 'EUR')
      product.update_columns(
        price_cents: price.cents,
        price_currency: price.currency.iso_code
      )
    end

    # Remove old decimal column
    remove_column :products, :price
  end

  def down
    # Restore original decimal column
    add_column :products, :price, :decimal, precision: 10, scale: 2

    # Convert money columns back to decimal
    Product.find_each do |product|
      price = Money.new(product.price_cents, product.price_currency)
      product.update_columns(price: price.to_f)
    end

    # Remove money columns
    remove_column :products, :price_cents
    remove_column :products, :price_currency
  end
end
