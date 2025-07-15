module ApplicationHelper
  def humanized_money_with_symbol_with_cents(money_object)
    number_to_currency(money_object, 
      precision: 2,
      strip_insignificant_zeros: false,
      unit: money_object.currency.symbol)
  end
end
