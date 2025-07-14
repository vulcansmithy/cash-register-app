require 'rails_helper'

RSpec.describe CartService do
  let!(:green_tea) { FactoryBot.create(:product, :green_tea) }
  let!(:strawberry) { FactoryBot.create(:product, :strawberry) }
  let!(:coffee) { FactoryBot.create(:product, :coffee) }

  describe '#calculate_total_with_discounts' do

    it 'applies BOGO discount for Green Tea' do
      service = CartService.new
      service.add_item('GR1')
      service.add_item('GR1')

      expect(service.calculate_total_with_discounts).to eq(3.11)
    end

    it 'applies bulk discount for Strawberries' do
      service = CartService.new
      3.times { service.add_item('SR1') }

      expect(service.calculate_total_with_discounts).to eq(13.50)
    end

    it 'applies volume discount for Coffee' do
      BigDecimal.limit(4)
      service = CartService.new
      3.times { service.add_item('CF1') }

      expect(service.calculate_total_with_discounts).to eq(22.46)
    end
  end
end