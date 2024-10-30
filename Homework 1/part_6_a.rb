# Extend the currency-conversion example from lecture so that you can write
# 5.dollars.in(:euros)
# 10.euros.in(:rupees)
# etc.

class Numeric
  @@currencies = {
    'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1
  }
  def method_missing(method_id, *args, &block)  # capture all args in case have to call super

    singular_currency = method_id.to_s.gsub( /s$/, '')  # Remove o 's' do final, caso exista

    if @@currencies.has_key?(singular_currency)
      Currency.new(self * @@currencies[singular_currency])  # Se a moeda existir, cria um novo objeto Currency
    else
      super # Se não existir, chama o metodo method_missing da superclasse
    end
  end
end

class Currency
  def initialize(amount_in_dollars)
    @amount_in_dollars = amount_in_dollars  # Guarda o valor em dolares
  end

  def in(target_currency)
    singular_currency = target_currency.to_s.gsub(/s$/, '') # Remove o 's' do final, caso exista
    if Numeric.class_variable_get(:@@currencies).has_key?(singular_currency)
      # Convert the amount in dollars to the target currency
      @amount_in_dollars / Numeric.class_variable_get(:@@currencies)[singular_currency] # Retorna o valor convertido
    else
      raise "Currency not supported"
    end
  end
end

puts 5.dollars.in(:euros) # => 5 / 1.292 = 3.87
puts 10.euros.in(:rupees) # => 10 * 1.292 = 12.92 / 0.019 = 678.95
puts 100.yen.in(:dollars) # => 100 * 0.013 = 1.3
puts 200.rupees.in(:yen) # => 200 * 0.019 = 3.8 / 0.013 = 292.31
puts 1.dollar.in(:rupees) # => 1 / 0.019 = 52.63
