class Array

  def my_each(&prc)
    (0...self.length).each do |index|
      prc.call(self[index])
    end
    self
  end

  def my_inject(&blk)
    result = self[0]
    self[1..-1].my_each { |el| result = blk.call(result, el) }
    result
  end

  def my_map(&prc)
    array = []
    self.my_each{ |el| array << prc.call(el) }
    array
  end

  def my_select(&prc)
    array = []
    self.my_each { |el| array << el if prc.call(el) }
    array
  end

  def my_sort!(&prc)
    sorted = false
    until sorted
      sorted = true
      (self.count - 1).times do |i|
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    self
  end

  def my_sort(&prc)
    self.dup.my_sort!(&prc)
  end
end

def eval_block(*args, &prc)
  if prc.nil?
    puts "NO BLOCK GIVEN!"
  else
    prc.call(*args)
  end
end

eval_block(1,2,3,4,5) do |*args|
  p args.inject(:+)
end
