require 'pp'
require './Questions'

class Game
  
  # def question
  #   number1 = 
  #   number2 
  # "#{player} what does #{randomNum} plus #{randomNum}"
  # end
  def initialize
    @player_1 = Player.new("player1")
    @player_2 = Player.new("player2")
    @current_player = @player_1
  end

  def toggle_player
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def start
    @current_player = @player_1
    # check player 1 and player 2 have lives 
    puts "Game Start"
    p "Welcome #{@player_1.name} and #{@player_2.name}"
    puts "P1: #{@player_1.check_lives}/3 vs P2: #{@player_2.check_lives}/3"
    # puts "#{@current_player.name}"
    chain_questions
  end

  def transition
    toggle_player
    puts "---- NEW TURN -----"
    chain_questions
  end

  def end_game
    @player_1.lives > @player_2.lives ? winner = @player_1 : winner = @player_2

    puts "The winner is #{winner.name}!"
    puts "-----GAME OVER-----"
    puts "Good bye!"
  end

  def chain_questions
    
    while @player_1.lives > 0 && @player_2.lives > 0 
    new_question = Questions.new
    new_question.print_question(@current_player)
    print "> "
    result = $stdin.gets.chomp.to_i

      if new_question.check_answer == result
        puts "P1: #{@player_1.check_lives}/3 vs P2: #{@player_2.check_lives}/3"
        transition
      else 
        puts "#{@current_player.name}: That is not correct!"
        @current_player.lose_round
        puts "P1: #{@player_1.check_lives}/3 vs P2: #{@player_2.check_lives}/3"
        if @player_1.lives == 0 || @player_2.lives == 0
          end_game
          break
        end
        transition
      end
    end
 
  end

end



