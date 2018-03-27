require './question'
require './player'

class Turn
  attr_accessor :question, :player

  def initialize(player)
    @question = Question.new
    @player = player
  end

  def play
    puts ""
    puts "----- NEW TURN -----"
    print "#{self.player.name}: #{self.question.ask}\n> "
    attempt = gets.chomp.to_i # Convert input to interger
    if self.question.test_answer(attempt)
      puts "#{self.player.name}: YES! You are correct"
      self.player.count_lives( win = true )
    else
      puts "#{self.player.name}: Seriously? No!"
      self.player.count_lives( win = false )
    end
  end

end