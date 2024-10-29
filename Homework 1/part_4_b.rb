# Create a class JellyBean that extends Dessert, and add a getter and setter for flavor.
# Modify delicious? to return false if the flavor is black licorice (but delicious? should still return true for all
# other flavors and for all non-JellyBean desserts)

class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200 # Se as calorias forem menores que 200, retorna true, senão, retorna false
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor  # Adiciona o sabor do JellyBean
  end

  def flavor  # Getter
    @flavor
  end

  def flavor=(flavor) # Setter
    @flavor = flavor
  end

  def delicious?
    @flavor == "black licorice" ? false : super # Se o sabor for "black licorice", retorna false, senão, chama o metodo da superclasse
  end
end

# Casos de teste
jb = JellyBean.new("JellyBean", 150, "black licorice")
puts jb.delicious?  # => false
puts jb.healthy?  # => true

jb.flavor = "strawberry"  # Altera o sabor do JellyBean para testar o setter
puts jb.delicious?  # => true
