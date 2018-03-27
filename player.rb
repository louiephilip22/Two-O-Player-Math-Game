class Player
  attr_accessor :name, :lives, :turn

  def initialize(name)
    @name = name
    @lives = 3
    @turn = true
  end

  def count_lives(win)
    if !win
      self.lives -= 1
    end
  end

end