print "Please input how many discs you would like to start with: "

board = [gets.chomp.to_i.downto(1).to_a, [], []]

puts "Game started!"
while true
  print "Peg 0: #{board[0].to_s}\n"
  print "Peg 1: #{board[1].to_s}\n"
  print "Peg 2: #{board[2].to_s}\n"

  if board[0].empty? && (board[1].empty? || board[2].empty?)
    print "You win!"
    break
  end
  puts "Which peg would you like to select a disc from? (Choose 0, 1, or 2): "
  from_pile = gets.chomp.to_i
  if board[from_pile].empty?
    p "Invalid move, please try again: "
    next
  end
  print "Which peg would you like to move to?: "
  to_pile = gets.chomp.to_i

  if board[to_pile].empty? || board[to_pile].last > board[from_pile].last
    board[to_pile] << board[from_pile].pop
  else
    print "Invalid move"
  end
  puts ""
end
