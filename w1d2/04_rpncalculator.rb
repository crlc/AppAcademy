class RPNCalculator
  def initialize
    @stack = []
  end

  def minimum?
    @stack.length > 1
  end

  def plus
    @stack << @stack.pop + @stack.pop
  end

  def minus
    second = @stack.pop
    first = @stack.pop
    @stack << first - second
  end

  def multiply
    @stack << @stack.pop * @stack.pop
  end

  def divide
    second = @stack.pop
    first = @stack.pop
    @stack << first / second
  end

  def push(x)
    @stack << x
  end

  def convert(x)
    operand_names = {
      '+' => 'plus',
      '-' => 'minus',
      '*' => 'multiply',
      '/' => 'divide'
    }
    operand_names[x]
  end

  def evaluation(expression)
    operands = %w( * / - + )
    expression.split(' ').each do |i|
      if operands.include?(i)
        self.send(convert(i).to_sym) if minimum?
      else
        push(i.to_i)
      end
    end
  end

  def read_file(file_name)
    File.open(file_name).each do |line|
      evaluation(line.chomp)
    end
  end

  def interactive
    user_input = nil
    while user_input != 'quit'
      display
      puts "Please enter an operator or operand.  Type 'quit' to exit"
      user_input = $stdin.gets.chomp
      evaluation(user_input)
    end

  end

  def display
    p @stack
  end
end

calculator = RPNCalculator.new

file_name = ARGV.first
if file_name == 'interactive'
  calculator.interactive
elsif !file_name.nil?
  calculator.read_file(file_name)
end
# calculator.evaluation('5 1 2 + 4 * + 3 -')
calculator.display
