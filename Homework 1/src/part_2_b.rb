#  A rock, paper, scissors tournament is encoded as a bracketed array of games - that is, each element can be
# considered its own tournament.

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2 # Verifica se o número de jogadores é igual a 2

  valid_strategies = ["R", "P", "S"]  # Define a lista de estratégias válidas

  player1, strategy1 = game[0][0], game[0][1].upcase  # Define o jogador 1 e sua estratégia com letras maiúsculas
  player2, strategy2 = game[1][0], game[1][1].upcase  # Define o jogador 2 e sua estratégia com letras maiúsculas

  raise NoSuchStrategyError unless valid_strategies.include?(strategy1) && valid_strategies.include?(strategy2) # Verifica se as estratégias são válidas

  if strategy1 == strategy2
    winner = [player1, strategy1] # Se as estratégias forem iguais, o jogador 1 vence
  elsif (strategy1 == "R" && strategy2 == "S") ||
    (strategy1 == "S" && strategy2 == "P") ||
    (strategy1 == "P" && strategy2 == "R")
    winner = [player1, strategy1] # Se a estratégia do jogador 1 vencer, ele vence
  else
    winner = [player2, strategy2] # Se a estratégia do jogador 2 vencer, ele vence
  end

  winner  # Retorna o vencedor e sua estratégia, em formato de array
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String)
    return rps_game_winner(tournament)  # Retorna o vencedor da partida se o torneio tiver apenas um jogo
  end

  winner1 = rps_tournament_winner(tournament[0])  # Define o vencedor do primeiro jogo
  winner2 = rps_tournament_winner(tournament[1])  # Define o vencedor do segundo jogo

  rps_game_winner([winner1, winner2]) # Retorna o vencedor da final
end

# Casos de teste
tournament = [
  [
    [ ["Kristen", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"], ["Michael", "S"] ]
  ],
  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]

p rps_tournament_winner(tournament) # Imprime o array com o vencedor e sua estratégia
# => ["Richard", "R"]
