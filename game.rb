#    Game:" State: Player1, player2    Behaviour: questionGenerator, Game Loop---> verifyAnswer && winner nextRound"
require './question.rb'
require './player.rb'


class Game 
  def initialize
    puts "Who is p1?"
    player1 = gets.chomp
    @player1 = Player.new(player1)
    puts "Whos is p2?"
    player2 = gets.chomp
    @player2 = Player.new(player2)
  end

  def questionGenerator
    @genQuestion = Question.new
    puts "---- NEW TURN ----"
    if @player1.turn
      puts "#{@player2.name}: #{@genQuestion.genQuestion}"  
    else 
      puts "#{@player1.name}: #{@genQuestion.genQuestion}"  
    end
  end

  def verifyAnswer
    if gets.chomp.to_i == @genQuestion.answer
      if @player1.turn
      puts "CORRECT!"
      @player1.turn = false
      @player2.turn = true
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      winner
    else 
      puts "CORRECT!"
      @player1.turn = true 
      @player2.turn = false
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      winner
    end
  else 
    if @player1.turn 
      @player1.lives -=1
      puts "WRONG!"
      @player1.turn = false
      @player2.turn = true
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      winner
    else
      @player2.lives -=1 
      puts "WRONG!"
     @player1.turn = true 
      @player2.turn = false
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      winner
    end
  end
end


  def winner
    if @player1.lives == 0

    puts "----- GAME OVER -----"
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3 "
      puts "Thank you, play again"
    elsif @player2.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3 "
      puts "Thank you, play again"
    else
      nextRound
    end
  end

  def nextRound
    questionGenerator
    verifyAnswer
  end
end
