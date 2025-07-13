require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.build(:product) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(product).to be_valid
    end

    it 'requires a unique code' do
      product.save
      duplicate_product = FactoryBot.build(:product, code: product.code)
      expect(duplicate_product).not_to be_valid
    end

    it 'requires a positive price' do
      product.price = -1
      expect(product).not_to be_valid
    end
  end
end
