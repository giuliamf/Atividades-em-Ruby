# Write a method that determines whether a given word or phrase is a palindrome, that is, it reads the same backwards as forwards, ignoring case, punctuation, and nonword characters.

def palindrome?(string)
  normalized_string = string.downcase.gsub(/\W/, '')
  puts normalized_string == normalized_string.reverse
end

# Casos de teste
palindrome?("A man, a plan, a canal -- Panama")
palindrome?("Madam, I'm Adam!")
palindrome?("Abracadabra")
