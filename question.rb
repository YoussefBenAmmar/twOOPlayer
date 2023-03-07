#    Question:" State: Questions, Answers, num1, num2      Behaviour:"


class Question
  attr_reader :genQuestion, :answer


  def initialize
    n1 = rand(1...100)
    n2 = rand(1...100)
    @genQuestion = "What does #{n1} + #{n2} equal?"
    @answer = n1 + n2
  end

end
