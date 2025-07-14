class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string  :code, null: false
      t.string  :name, null: false
      t.integer :price_cents
      t.string  :price_currency

      t.timestamps
    end
  end
end
