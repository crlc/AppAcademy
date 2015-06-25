def range(start_num, end_num)
  return [] if end_num <= start_num
  range(start_num, end_num - 1) << end_num -1
end

def sum_iter(nums)
  result = 0
  nums.each { |el| result += el }
  result
end

def sum_recursive(nums)
  return 0 if nums.empty?
  nums.shift + sum_recursive(nums)
end

def my_exponent1(base, exp)
  exp == 0 ? 1 : base * my_exponent1(base, exp-1)
end

def my_exponent2(base, exp)
  return 1 if exp == 0
  return base if exp == 1
  half = my_exponent2(base, exp/2 )
  if exp.even?
    half * half
  else
    half * half * base
  end
end

class Array
  def deep_dup
    return nil unless self.any?
    result = []
    self.each do |el|
      result << el.is_a?(Array) ? el.deep_dup : el
    end
  end
end

def fib(n)
  return [] if n == 0
  return [0] if n == 1

  fibs = [0, 1]
  while fibs.count < n
    fibs << result [-1] + result[-2]
  end
  fibs
end

def fib_recursive(n)
  return [0,1].take(n) if n <= 2
  fibs = fib_recursive(n - 1)
  fibs << fibs[-1] + fibs[-2]
end

def bsearch(nums,target)
  return nil if nums.count == 0
  middle = nums.length / 2

  case target <=> nums[middle]
  when -1
    bsearch(nums.take(middle), target)
  when 0
    middle
  when 1
    sub_answer = bsearch(nums.drop(middle + 1), target)
    sub_answer.nil? ? nil : middle + 1 + sub_answer
  end
end

def make_change(target, coins = [25, 10, 5, 1])
  return [] if target == 0
  return nil if coins.none? { |coin| coin <= target }
  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    next if coin > target
    remainder = target - coin
    best_remainder = make_change(remainder, coins.drop(index))
    next if best_remainder.nil?
    this_change = [coin] + best_remainder

    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end

class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << left.first < right.first ? left.shift : right.shift
    end

    merged_array + left + right
  end

  def subsets
    return [[]] if empty?
    subs = take(count - 1).subsets
    subs.concat(subs.map { |sub| sub + [last] })
  end
end
