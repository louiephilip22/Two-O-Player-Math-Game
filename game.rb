require './player'
require './turn'

class Game
  attr_accessor :player1, :player2

  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
  end

  def play
    self.check_and_game
  end

  def match
    if player1.turn
      Turn.new(self.player1).play
      self.player1.turn = false
      self.player2.turn = true
    else
      Turn.new(self.player2).play
      self.player1.turn = true
      self.player2.turn = false
    end
    self.print_game_status
    self.check_and_game
  end

  def check_and_game
    if self.player1.lives == 0 || self.player2.lives == 0
      self.finalize
    else
      while self.player1.lives > 0 && self.player2.lives > 0
        self.match
      end
    end
  end

  def finalize
    puts ""
    if (player1.lives == 0)
      puts "Player 2 wins with a score of #{player2.lives}/3"
    end
    if (player2.lives == 0)
      puts "Player 1 wins with a score of #{player1.lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def print_game_status
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
  end

end
