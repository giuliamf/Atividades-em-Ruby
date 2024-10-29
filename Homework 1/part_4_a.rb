# https://github.com/giuliamf
# Giulia Moura, 200018795

#  Create a class Dessert with getters and setters for name and  calories. Define instance methods healthy?,
# which returns true if a dessert has less than 200 calories, and delicious?, which returns true for all desserts.

class Dessert
  def initialize(name, calories)
    @name = name  
    @calories = calories  
  end
  def healthy?
    @calories < 200 ? true : false # Se as calorias forem menores que 200, retorna true, senão, retorna false
    end
  def delicious?
    true
  end
end

# Casos de teste
dessert = Dessert.new("Bolo", 300)
puts dessert.healthy?  # => false
puts dessert.delicious?  # => true

dessert = Dessert.new("Salada de Frutas", 150)
puts dessert.healthy?  # => true
puts dessert.delicious?  # => true
