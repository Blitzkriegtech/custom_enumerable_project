module Enumerable
  def my_map
    new_arr = []
      for item in self
        new_arr << yield(item)
      end
    new_arr
  end

  def my_none?
    self.each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_each_with_index
    index = 0
      for item in self
        yield(item, index)
        index += 1
      end
    self
  end

  def my_all?
    self.each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_count
    if block_given?
      index = 0
      self.each do |elem|
        index += 1 if yield(elem)
      end
      index
    else
    return self.size
    end
  end

  def my_inject(initial = nil)
    if initial.nil?
        accumulator = self[0]
        start_index = 1
    else
      accumulator = initial
      start_index = 0
    end
      (start_index...length).each do |index|
      accumulator = yield(accumulator, self[index])
      end
      accumulator
  end

  def my_select
    new_arr = []
    self.each do |ele|
      new_arr << ele if yield(ele)
    end
    new_arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield(item)
    end
  end
end
