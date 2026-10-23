# =============================================================================
# 14 - BLOCKS
# =============================================================================
# A block is an anonymous chunk of code attached to a method call, written with
# { ... } (one line) or do ... end (multi-line). Methods run a block with
# `yield` (or by capturing it as `&block`). Blocks are the heart of Ruby's
# iterators.
# =============================================================================

puts "--- yield & block_given? ---"
def with_banner
  puts "==== start ===="
  yield if block_given?
  puts "==== end ======"
end

with_banner { puts "hello from the block" }
with_banner   # no block -> yield is skipped, no error

puts "\n--- { } vs do..end (both are blocks) ---"
[1, 2, 3].each { |n| print "#{n} " } # one-liner style
puts
[1, 2, 3].each do |n|                # multi-line style
  print "#{n * n} "
end
puts

puts "\n--- yield can pass values INTO the block ---"
def repeat(times)
  (1..times).each { |i| yield(i) }   # the block receives i
end
repeat(3) { |i| puts "iteration #{i}" }

puts "\n--- A block can yield multiple values ---"
def each_pair
  yield(:a, 1)
  yield(:b, 2)
end
each_pair { |key, value| puts "#{key} => #{value}" }

puts "\n--- The block's return value flows back to the method ---"
def transform(value)
  yield(value)   # whatever the block returns is returned here
end
p transform(5) { |n| n * 10 } # => 50

puts "\n--- Implement your own iterator (how each/find work internally) ---"
class NumberList
  include Enumerable               # gives map/select/sort/... once #each exists

  def initialize(*numbers) = @numbers = numbers

  def each
    i = 0
    while i < @numbers.length
      yield(@numbers[i])           # hand each element to the caller's block
      i += 1
    end
  end
end

list = NumberList.new(3, 1, 2)
list.each { |n| print "#{n} " }    # => 3 1 2
puts
p list.map { |n| n * 2 }           # => [6, 2, 4]  (free via Enumerable)
p list.select(&:odd?)              # => [3, 1]
p list.sort                        # => [1, 2, 3]
p list.max                         # => 3

puts "\n--- Guaranteed cleanup pattern (yield between setup/teardown) ---"
def timed
  start = 0            # pretend clock
  result = yield
  puts "work done (elapsed since #{start})"
  result
end
p timed { [1, 2, 3].sum } # => 6
