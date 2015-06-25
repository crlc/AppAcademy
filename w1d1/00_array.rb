class Array

  def my_uniq
    uniq_array = []
    self.each do |element|
      uniq_array << element unless uniq_array.include?(element)
    end
    uniq_array
  end

  def two_sum
    indeces = []
    self.each_with_index do |element1, idx1|
      self.each_with_index do |element2, idx2|
        indeces << [idx1,idx2] if element1 + element2 == 0 && idx1 < idx2
      end
    end
    indeces
  end

end

def my_transpose(my_array)
  transposed = Array.new(my_array.size) { [] }
  # Hash.new { |h, k| h[k] = some_value }
  my_array.each_with_index do |row, idx1|
    row.each_index do |idx2|
      transposed[idx2][idx1] = row[idx2]
    end
  end
  transposed
end

def stock_picker(stock_prices)
  days = []
  profit = 0
  stock_prices.each_with_index do |min, buy|
    stock_prices.each_with_index do |max, sell|
      if max - min > profit && sell > buy
        days = [buy, sell]
        profit = max - min
      end
    end
  end
  days
end
