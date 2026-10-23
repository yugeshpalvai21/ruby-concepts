# =============================================================================
# 04 - ARRAYS
# =============================================================================
# Arrays are ordered, integer-indexed, growable collections of any objects.
# =============================================================================

puts "--- Creating arrays ---"
p [1, 2, 3]                 # literal
p %w[red green blue]        # => ["red", "green", "blue"] (word array)
p %i[asc desc]              # => [:asc, :desc]            (symbol array)
p Array.new(3, 0)           # => [0, 0, 0]  (length, default value)
p Array.new(3) { |i| i * i } # => [0, 1, 4] (default from block)
p Array(1..5)               # => [1, 2, 3, 4, 5]
p (1..5).to_a               # => [1, 2, 3, 4, 5]
p [*1..5]                   # => [1, 2, 3, 4, 5] (splat a range)

puts "\n--- Accessing elements ---"
nums = [10, 20, 30, 40, 50]
p nums[0]        # => 10
p nums[-1]       # => 50 (from the end)
p nums[1, 2]     # => [20, 30] (start, length)
p nums[1..3]     # => [20, 30, 40] (inclusive range)
p nums[1...3]    # => [20, 30] (exclusive range)
p nums.first(2)  # => [10, 20]
p nums.last(2)   # => [40, 50]
p nums.dig(2)    # => 30 (safe nested access)
p nums.values_at(0, 2, 4) # => [10, 30, 50]

puts "\n--- Adding & removing ---"
stack = [1, 2, 3]
stack.push(4)       # => [1,2,3,4] (or stack << 4)
stack << 5          # => [1,2,3,4,5]
p stack.pop         # => 5  (removes & returns last)
stack.unshift(0)    # => [0,1,2,3,4] (prepend)
p stack.shift       # => 0  (removes & returns first)
stack.insert(1, 99) # => [1,99,2,3,4]
p stack
p stack.delete(99)  # => 99 (removes all matching)
p stack

puts "\n--- Querying ---"
nums = [10, 20, 30, 40, 50]
p nums.length        # => 5 (also .size, .count)
p nums.include?(30)  # => true
p nums.index(30)     # => 2
p nums.min           # => 10
p nums.max           # => 50
p nums.sum           # => 150
p nums.empty?        # => false

puts "\n--- Transforming (functional, returns new arrays) ---"
p [1, 2, 3, 4].map { |n| n * n }          # => [1, 4, 9, 16]
p [1, 2, 3, 4].select(&:even?)            # => [2, 4]  (keep matching)
p [1, 2, 3, 4].reject(&:even?)            # => [1, 3]  (drop matching)
p [1, 2, 3, 4].find { |n| n > 2 }         # => 3       (first match)
p [1, 2, 3, 4].partition(&:even?)         # => [[2, 4], [1, 3]]
p [3, 1, 2].sort                          # => [1, 2, 3]
p [3, 1, 2].sort_by { |n| -n }            # => [3, 2, 1]
p [1, 2, 3, 4].reduce(:+)                 # => 10 (sum via reduce)
p [1, 2, 3, 4].each_with_object([]) { |n, acc| acc << n * 2 } # => [2,4,6,8]
p [1, 2, 3].zip([4, 5, 6])                # => [[1,4],[2,5],[3,6]]
p [1, 1, 2, 3, 3].uniq                    # => [1, 2, 3]
p [1, [2, [3, 4]]].flatten                # => [1, 2, 3, 4]
p [1, 2, 3, 4, 5].each_slice(2).to_a      # => [[1,2],[3,4],[5]]
p ["a", "b"].each_with_index.map { |v, i| "#{i}:#{v}" } # => ["0:a", "1:b"]

puts "\n--- Boolean checks across elements ---"
p [2, 4, 6].all?(&:even?)   # => true
p [1, 2, 3].any?(&:even?)   # => true
p [1, 3, 5].none?(&:even?)  # => true
p [1, 2, 3].count(&:odd?)   # => 2

puts "\n--- Chaining reads top-to-bottom ---"
result = (1..10)
  .select(&:even?)       # [2, 4, 6, 8, 10]
  .map { |n| n * n }     # [4, 16, 36, 64, 100]
  .reduce(:+)            # 220
p result # => 220

puts "\n--- Destructuring ---"
first, *rest = [1, 2, 3, 4]
p first  # => 1
p rest   # => [2, 3, 4]
a, (b, c) = 1, [2, 3]  # nested
p [a, b, c] # => [1, 2, 3]
