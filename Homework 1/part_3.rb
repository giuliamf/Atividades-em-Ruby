# Given an array of strings, write a method that groups them into anagram groups and returns the array of groups.
# Case doesn't matter in classifying string as anagrams (but case should be preserved in the output), and the order of
# the anagrams in the groups doesn't matter

def combine_anagrams(words)
  anagrams = Hash.new
  words.each do |word|
    key = word.downcase.chars.sort.join # Para cada palavra no array de palavras, define a chave como a palavra em letras minúsculas, ordenadas e juntas
    if anagrams.has_key?(key)
      anagrams[key].push(word)  # Se a chave já existir, adiciona a palavra ao array de palavras
    else
      anagrams[key] = [word]  # Se a chave não existir, cria um novo array de palavras
    end
  end
  p anagrams.values # Retorna os valores do hash de anagramas
end

# Casos de teste
combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
# => [["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]]
