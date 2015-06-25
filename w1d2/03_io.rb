class NumberGuessingGame
  def initialize
    @computer_guess = rand(1..100)
  end

  def guess
    puts "Input your guess: "
    @user_guess = Integer(gets)
  end

  def play

    guesses = 0
    while true
      guess
      guesses += 1
      if @computer_guess < @user_guess
        puts "Too high! Guess: #{guesses}"

      elsif @user_guess < @computer_guess
        puts "Too low! Guess: #{guesses}"
      else
        puts "You win in #{guesses} guesses!"
        break
      end
    end
  end
end

# new_game = NumberGuessingGame.new
# new_game.play

def shuffle_file
  puts "What file would you like to shuffle?"
  file_name = gets.chomp
  lines = []

  File.open(file_name).each { |line| lines << line.chomp }
  lines.shuffle!
  new_file = file_name[0..-4] + "-shuffled.txt"
  f = File.open(new_file, "w")

  lines.each do |line|
    f.puts"#{line}"
  end
  f.close

end

shuffle_file
