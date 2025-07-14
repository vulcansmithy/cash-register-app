require 'rails_helper'

RSpec.describe CartService do
  let!(:green_tea) { FactoryBot.create(:product, code: 'GR1', price: 3.11) }
  let!(:strawberry) { FactoryBot.create(:product, code: 'SR1', price: 5.00) }
  let!(:coffee) { FactoryBot.create(:product, code: 'CF1', price: 11.23) }

  describe '#calculate_total_with_discounts' do
    it 'applies volume discount for Coffee' do
      service = CartService.new
      3.times { service.add_item('CF1') }

      expect(service.calculate_total_with_discounts).to eq(67.38)
    end
  end
end