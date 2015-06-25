class RPNCalculator
  def initialize
    @stack = []
  end
  def push(x)
    @stack.push(x)
  end
  def plus
    if @stack.length == 0
      raise "calculator is empty"
    else
      @stack.push(@stack.pop + @stack.pop)
    end
  end
  def minus
    if @stack.length == 0
      raise "calculator is empty"
    else
      first = @stack.pop
      second = @stack.pop
      @stack.push(second - first)
    end
  end
  def divide
    if @stack.length == 0
      raise "calculator is empty"
    else
      first = @stack.pop
      second = @stack.pop
      @stack.push(second / first.to_f)
    end
  end
  def times
    if @stack.length == 0
      raise "calculator is empty"
    else
      @stack.push(@stack.pop * @stack.pop)
    end
  end

  def value
    @stack[-1]
  end
  def tokens(x)
    stuff = []
    x.split.each {|i| !(i.match(/\d/) == nil) ? stuff << i.to_i : stuff << i.to_sym}  #What is the object class of a mathematical operator??
    stuff
  end
  def evaluate(x)
    tokens(x).each do |i|
      case i
        when :/
          divide
        when :*
          times
        when :+
          plus
        when :-
          minus
        else
          @stack.push(i)
      end
    end
    @stack[-1]
  end
end
calculator = RPNCalculator.new
calculator.evaluate("1 2 3 * +")
