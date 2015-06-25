class MyHashSet
  attr_accessor :store

  def intialize
    @store = {}
  end

  def self.insert(el)
    @store[el] = true
  end

  def self.include?(el)
    @store.has_key?(el)
  end

  def self.delete(el)
    if self.include?(el)
      @store.delete(el)
      true
    else
      false
    end
  end

  def self.to_a
    @store.each_with_object([]) { |element, result| result << element }
  end

  def self.union(set2)
    self.merge(set2).keys
  end

  def self.intersect(set2)
    set2.keys.each.select {|key| self.keys.include?(key)}
  end

  def self.minus(set2)
    self.keys.each.reject {|key| set2.keys.include?(key)}
  end
end
