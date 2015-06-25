def factors(num)
  (1..num).select { |i| num % i == 0 }
end

# p factors(12)

def bubble_sort(array)
  swapped = true
  count = 0
  while swapped
    swapped = false
    (1...array.length-count).each do |el|
      if array[el] < array[el - 1]
        array[el], array[el - 1] = array[el - 1], array[el]
        swapped = true
      end
    end

    count += 1
  end
  array

end

# p bubble_sort([4,3,56,2,1,45,7])

def substrings(string)
  result = []

  (0..string.length).each do |lens|
    (0...string.length).each do |start|
      word = string[start..(start + lens)]
      result << word unless result.include?(word)
    end
  end

  result
end

def sub_words(word)
  file_name = "dictionary.txt"
  dictionary = []
  File.open(file_name).each do |line|
    dictionary << line.chomp
  end

  substrings(word).select { |el| dictionary.include?(el) }
end

p sub_words("cat")
