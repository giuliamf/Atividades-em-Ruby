# Adapt your solution from the "palindromes" question so that instead of writing palindrome?("foo") you can write "foo".palindrome?

class String
  def palindrome?
    normalized_string = self.downcase.gsub(/\W/, '')  # Remove palavras não alfanuméricas e converte para minúsculas
    normalized_string == normalized_string.reverse # Verifica se a string é igual a ela mesma invertida e retorna o resultado
  end
end

# Casos de teste
puts "A man, a plan, a canal -- Panama".palindrome? # => true
puts "Madam, I'm Adam!".palindrome? # => true
puts "Abracadabra".palindrome? # => false
