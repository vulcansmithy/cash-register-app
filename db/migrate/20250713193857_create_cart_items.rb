class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :subtotal_cents
      t.string  :subtotal_currency

      t.timestamps
    end
  end
end
