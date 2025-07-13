require 'rails_helper'

RSpec.describe CartService do
  # @TODO
  
  let(:green_tea) { FactoryBot.create(:product, code: 'GR1', price: 3.11) }
  let(:strawberry) { FactoryBot.create(:product, code: 'SR1', price: 5.00) }
  let(:coffee) { FactoryBot.create(:product, code: 'CF1', price: 11.23) }
  
  describe '#calculate_total_with_discounts' do
    it 'intentionally fail' do
      expect(true).to eq(false)
    end
  end
end
