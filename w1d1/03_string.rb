TRANSLATE = {
  10 => "A",
  11 => "B",
  12 => "C",
  13 => "D",
  14 => "E",
  15 => "F"
}

def num_to_s(num, base)
  pow = 0
  result = []
  until num / (base ** pow) == 0
    digit = num/(base ** pow) % base
    digit = TRANSLATE[digit] if digit > 9
    result.unshift(digit)
    pow += 1
  end
  result.join("")
end

puts num_to_s(234, 16)

def caesar(string, shift)
  result = []
  string = string.split("")
  string.each do |char|
    letter = (char.ord - "a".ord + shift ) % 26
    letter = letter + "a".ord
    result << letter.chr
  end
  result
end

p caesar("abcdxyz", 1)
