# https://github.com/giuliamf
# Giulia Moura, 200018795

# Implementar um programa em Ruby que faça o parser do arquivo anexo e que retorne no seguinte formato:
# MATRICULA <TAB> NOME_COMPLETO

file_path = "engsoft.txt"
file = File.open(file_path, "r:ISO-8859-1")

file.each_line do |line|
  match = line.match(/(\d{2}\/\d{7})\s+(.+)/)
  if match
    matricula = match[1]
    nome = match[2].strip
    puts "#{matricula} #{nome}" # Se a linha corresponder ao padrão, imprime a matrícula e o nome
  end
end
