module PricingRules
  class BaseRule
    def initialize(items)
      @items = items
    end

    def calculate_discount
      raise NotImplementedError
    end
  end
end
