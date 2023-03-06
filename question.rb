#    Question:" State: Questions, Answers, num1, num2      Behaviour:"


class Question

  def initialize
    n1 = rand(1...100)
    n2 = rand(1...100)
    @quesiton = "What does #{n1} + #{n2} equal?"
    @answer = answer
  end

end
