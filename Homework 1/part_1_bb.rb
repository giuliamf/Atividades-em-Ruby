# Given a string of input, return a hash whose keys are words in the string and whose values are the number of times each word appears

def count_words(string)
  words = string.downcase.scan(/\w+/) # Converte a string para minúsculas e extrai palavras alfanuméricas
  frequency = Hash.new(0)            # Cria um hash com valor padrão 0
  words.each { |word| frequency[word] += 1 }  # Conta o valor da chave correspondente a cada palavra
  puts frequency  # Imprime o hash
end

# Casos de teste
count_words("A man, a plan, a canal -- Panama")
# => {"a"=>3, "man"=>1, "plan"=>1, "canal"=>1, "panama"=>1}
count_words("Doo bee doo bee doo")
# => {"doo"=>3, "bee"=>2}
