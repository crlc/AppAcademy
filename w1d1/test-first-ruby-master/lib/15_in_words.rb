TRANSLATE_TO_TEENS = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

TENS = {
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety'
}

LARGE = {
  100 => "hundred",
  1000 => "thousand",
  1000000 => "million",
  1000000000 => "billion",
  1000000000000 => "trillion"
}

class Fixnum

  def in_words
    output = []
    var = self
    return TRANSLATE_TO_TEENS[var] if var <= 19
    while var > 0
      if var <=19
        output << var.in_words
        var -= var
      elsif var < 100
        TENS.keys.reverse.each do |key|
          if var / key == 1
            var = var % key
            output << TENS[key]
          end
        end
      else
        LARGE.keys.reverse.each do |key|
          if var / key >= 1
            remainder, var = var.divmod(key)
            output << remainder.in_words
            output << LARGE[key]
          end
        end
      end
    end
    output.join(' ')
  end

end
