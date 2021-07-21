require 'byebug'

def range(min, max)
    return [] if max <= min 
    range(min, max - 1) << max - 1
end

def sum_rec(arr)
    return 0 if arr.empty?
    return arr.first if arr.length == 1 
    sum_rec(arr[1..-1]) + arr.first
end

def sum_ite(arr)
    sum = 0
    arr.each { |ele| sum += ele }
    sum
end

def exponent(b, n) 
    return 1 if n == 0
    b * exponent(b, n - 1)
end

def exponent_two(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        even_rec_call = exponent_two(b, n / 2)
        even_rec_call * even_rec_call
    else
        odd_rec_call = exponent_two(b, (n - 1) / 2)
        odd_rec_call * odd_rec_call * b
    end
end



class Array
    def dup
        empty = []
        self.each { |ele| empty << ele } 
        empty
    end

    
    def deep_dup
        empty = []
        self.each do |ele|
            if ele.is_a?(Array)
                empty << ele.deep_dup
            else
                empty << ele
            end
        end
        empty
    end
end



def fibonacci_ite(n)
    temp_arr = [0, 1]
    while temp_arr.length < n
        temp_arr << temp_arr[-2] + temp_arr[-1]
    end
    temp_arr
end

def fibonacci_rec(n) # [0, 1, 1, 2, 3, 5 etc]
    return [0] if n == 1 # 
    return [0, 1] if n == 2 # BC
    prev_fib = fibonacci_rec(n-1) #returns array
    current_fib = prev_fib[-1] + prev_fib[-2] #integer
    prev_fib << current_fib
end










def bsearch(arr, target) # [7, 5], 6 == nil  [5], 5 == 0 
    return nil if arr.empty?  
    midpoint = arr.length / 2  
    less = arr.take(midpoint) 
    greater = arr.drop(midpoint + 1) # drop the arr until midpoint 3

    if target == arr[midpoint] # idx 3 == 4
        return midpoint
    elsif target > arr[midpoint] 
        greater_rec_call = bsearch(greater, target)
        if greater_rec_call.nil?
            return nil
        end
        midpoint + 1 + greater_rec_call # [5, 6], 6
    else
        bsearch(less, target) # [1, 2, 3]
    end

end



def merge_sort(arr)
    return arr if arr.length <= 1 

    midpoint = arr.length / 2
    left = merge_sort(arr[0...midpoint])  
    right = merge_sort(arr[midpoint..-1]) 
    merge_help(left, right) 
end


def merge_help(left, right) 
    return right if left.empty? 
    return left if right.empty? 
    
    if left.first > right.first
        [right.shift] + merge_help(left, right)
    else
        [left.shift] + merge_help(left, right)
    end

end






def subsets(arr) # :(
    # BASE CASE
    return [[]] if arr.empty? # [[]]
    # INDUCTIVE STEP
    # last_ele = arr.pop
    # other_last_ele = arr[-1]
    # next_to_last_ele = arr[-2]
    arr.each do |ele|
        subsets(arr) << # all_combinations
    end
    # [last_ele] # + [other_last_ele] + [next_to_last_ele]
    
end

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
