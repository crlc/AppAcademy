def array_int(input)
  input.map { |value| value * 2 }
end

class Array
  def my_each
    yield self
    return self
  end
end

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
p return_value # => [1, 2, 3]


def my_median(input)
  input.sort!
  index = input.length
  if index % 2 == 0
    return (input[index/2] + input[index/2 -1]) / 2
  else
    return input[index/2]
  end
end

def concatenate(arr_str)
  arr_str.inject("") { |result, element| result + element }
end

print concatenate(["Yay ", "for ", "strings!"])
# => "Yay for strings!"
