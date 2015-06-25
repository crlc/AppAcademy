def super_print(string, options = {})
  defaults = {
    times: 1,
    upcase: false,
    reverse: false
    }
  options = defaults.merge(options)
  if options[:upcase]
    string.upcase!
  end
  if options[:reverse]
    string.reverse!
  end
  options[:times].times do |i|
    puts string
  end
end

super_print("hello", {upcase: true, times: 30})
