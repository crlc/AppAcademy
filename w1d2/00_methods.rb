def rps(choice)
  choices = ['rock', 'paper', 'scissors']

  unless choices.include?(choice)
    puts "Invalid choice!"
    return
  end
  computer_choice = choices.sample

  if choice == computer.choice
    return "#{computer_choice}, Draw"
  end

  wins = [
    ['rock', 'scissors'],
    ['paper', 'rock'],
    ['scissors', 'paper']
  ]

  if wins.include?([choice, computer_choice])
    "#{computer_choice}, Win"
  else
    "#{computer_choice}, Lose"

  end
end

# puts rps('rock')
# puts rps('paper')
# puts rps('scissor')


def remix(drinks)
  same_drinks = true

  while same_drinks
    same_drinks = false

    alcohol = drinks.map(&:first)
    mixers = drinks.map(&:last)

    alcohol.shuffle!
    mixers.shuffle!

    tray = []

    drinks.length.times do |i|
      pair = [alcohol.pop, mixers.pop]
      same_drinks = true if drinks.include?(pair)
      tray << pair
    end
  end


  tray

end

p remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])
