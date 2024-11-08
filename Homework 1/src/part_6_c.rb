# Adapt your palindrome solution so that it works on Enumerables.
# That is: [1,2,3,2,1].palindrome? # => true
# HINT: this should require fewer than 5 lines of code.
# Although hashes are considered Enumerables, your solution does not need to make sense for hashes

module Enumerable
  def palindrome?
    self.to_a == self.to_a.reverse # Verifica se o array é igual a ele mesmo invertido e retorna o resultado
  end
end

puts [1,2,3,2,1].palindrome?  # => true
puts [1,2,3,4,5].palindrome?  # => false
puts [1,2,3,2,1,2].palindrome?  # => false
