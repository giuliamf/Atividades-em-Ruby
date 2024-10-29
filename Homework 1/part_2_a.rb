# Write a method rps_game_winner that takes a two-element list and behaves as follows:
# - If the number of players is not equal to 2, raise WrongNumberOfPlayersError
# - If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise NoSuchStrategyError
# - Otherwise, return the name and strategy of the winning player. If both players use the same strategy, the first player is the winner.

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

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

  p winner  # Imprime o vencedor e sua estratégia, em formato de array
end

# Casos de teste
rps_game_winner([["Kristen", "R"], ["Pam", "S"]])
rps_game_winner([["Alice", "R"], ["Bob", "R"]])
