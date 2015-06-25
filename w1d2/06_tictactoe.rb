class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def won?
    # Horizontal Check
    @board.each do |row|
      if row.sum == 3 || row.sum == 0
        return true
      end
    end

    #Vertical Check
    (0..2).to_a.each do |col|
      count = nil
      (0..2).to_a.each do |row|
        pos = @board[row][col]
        (count.nil? ? count = 0 : count += pos) unless pos.nil?
      end
      if count == 3 || count == 0
        return true
      end
    end

    #Diagonal Check
    left_stroke = [[0, 0], [1, 1], [2, 2]]
    right_stroke = [[0, 3], [1, 1], [3, 0]]
  end

  def winner
  end

  def empty?(pos)
    @board[pos[0]][pos[1]].nil?
  end

  def place_mark(pos, mark)
    @board[pos[0]][pos[1]] = mark if empty?(pos)
  end

  def display
    @board.each {|i| p i}
  end


end

class Game

end

class Player

end
