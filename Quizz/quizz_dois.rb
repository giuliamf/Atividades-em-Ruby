# https://github.com/giuliamf
# Giulia Moura, 200018795

# Estenda o programa que faz o parsing da chamada para permitir que a impressão possa ser ordenada por ordem de
# matrícula ou por ordem alfabética dos nomes dos alunos utilizando o yield.

def sort_chamada(file)
  alunos = []
  file.each_line do |line|
    match = line.match(/(\d{2}\/\d{7})\s+(.+)/)
    if match
      matricula = match[1]
      nome = match[2].strip
      alunos << { matricula: matricula, nome: nome }
    end
  end

  alunos = yield(alunos) if block_given?

  alunos.each do |aluno|
    puts "#{aluno[:matricula]} #{aluno[:nome]}"
  end
end


file_path = "engsoft.txt"
file = File.open(file_path, "r:ISO-8859-1")

puts "Digite a opção de ordenação desejada:"
puts "1. Matrícula"
puts "2. Nome"

opcao = gets.chomp.to_i # Lê o valor digitado pelo usuário
if opcao == 1
  sort_chamada(file) do |alunos|
    alunos.sort_by { |aluno| aluno[:matricula] } # Ordena a chamada por matrícula
  end
elsif opcao == 2
  sort_chamada(file) do |alunos|
    alunos.sort_by { |aluno| aluno[:nome] } # Ordena a chamada por nome
  end
else
  puts "Opção inválida"
end
