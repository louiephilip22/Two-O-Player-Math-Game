class Question
  attr_accessor :n1, :n2

  def initialize
    @n1 = rand(19) + 1
    @n2 = rand(19) + 1
  end

  def ask
    "What does #{self.n1} plus #{self.n2} equal?"
  end

  def test_answer(attempt)
    attempt == self.n1 + self.n2
  end

end