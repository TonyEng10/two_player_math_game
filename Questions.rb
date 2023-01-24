# require 'active_support/all'

class Questions
  def print_question(player)
   puts "#{player.name}: what does #{@number1} plus #{@number2} equal?"

  end

  
  def initialize()
      @number1 = rand(1..20)
      @number2 = rand(1..20)
  
    end

  def check_answer
    @number1 + @number2
    # if answer == correct
    #   puts "That is correct"  
    # else puts "No that is wrong"
    # end
  # end
  end
end

# @questions = [
#   {
#     :"1" => "What does 5 plus 6 equal",
#     :answer => "11"
#   },
#   {
#     :"2" => "What does 3 plus 7 equal",
#     :answer => "10"
#   },
#   {
#     :"3" => "What does 1 plus 14 equal",
#     :answer => "15"
#   },
#   {
#     :"4" => "What does 12 plus 18 equal",
#     :answer => "30"
#   },
#   {
#     :"5" => "What does 2 plus 11 equal",
#     :answer => "13"
#   }
# ]