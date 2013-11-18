def range(start, finish, range_nums = nil)
  range_nums.nil? ? elements = [] : elements = range_nums

  el = start + 1

  if el >= finish
    return elements
  else
    elements << el
    return range(el, finish, elements)
  end
end

def recursive_sum(nums)
  return nums[0] if nums.length == 1
  nums.pop + recursive_sum(nums)
end

def iterative_sum(nums)
  nums.inject(:+)
end

def exp1(base, exp)
  return 1 if exp == 0
  base * exp1(base, exp - 1)
end

def exp2(base, exp)
  p exp
  return 1 if exp == 0
  exp.even? ? (exp2(base, (exp / 2)) * exp2(base, (exp / 2))) :
              (base * (exp2(base, (exp - 1) / 2) * exp2(base, (exp - 1) / 2)))

end

def deep_dup(element)
  return element unless element.is_a?(Array)
  array = []
  element.each do |el|
    array << deep_dup(el)
  end
  array
end


def iterative_fib(n)
  fibs = []
  fibs << 0 if n >= 1
  fibs << 1 if n >= 2
  p fibs
  (n-3).times do
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end

def recursive_fib(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0,1] if n == 2
  fibs = recursive_fib(n-1)
  fibs << (fibs[-1]+fibs[-2])
end

def bsearch(array, target)
  middle = array.length/2
  return middle if target == array[middle]
  return nil if middle == 0
  return bsearch(array[0..middle-1], target) if target < array[middle]

  right_side = bsearch(array[middle..-1], target)

  return nil if right_side.nil?
  right_side + middle
end

def subsets(array)
  power_set = [[]]

  array.length.times do |i|
    power_set += subsets_helper(array, i)
  end
  power_set
end

def merge_sort(unsorted_array)
  return unsorted_array if unsorted_array.length == 1

  middle = unsorted_array.length/2
  left_side = unsorted_array[0..middle-1]
  right_side = unsorted_array[middle..-1]

  return sort(merge_sort(left_side), merge_sort(right_side))
end

def sort(left, right)
  sorted_array = []
  l_index = 0
  r_index = 0

  while(l_index < left.length || r_index < right.length)
    if(l_index < left.length && r_index < right.length)
      if(left[l_index] <= right[r_index])
        sorted_array << left[l_index]
        l_index += 1
      else
        sorted_array << right[r_index]
        r_index += 1
      end
    elsif(l_index == left.length)
      sorted_array << right[r_index]
      r_index += 1
    else
      sorted_array << left[l_index]
      l_index += 1
    end
  end
  sorted_array
end









