# =============================================================================
# 01 - DATA TYPES
# =============================================================================
# Everything in Ruby is an object, and every object has a class.
# `#class` tells you what type an object is. Run this file with:
#   ruby 01_data_types.rb
# =============================================================================

puts "--- Core data types and their classes ---"

p "a string".class        # => String
p :a_symbol.class          # => Symbol
p 42.class                 # => Integer
p 3.14.class               # => Float
p (1r / 3).class           # => Rational  (exact fractions, e.g. (1/3))
p (2 + 3i).class           # => Complex
p true.class               # => TrueClass
p false.class              # => FalseClass
p nil.class                # => NilClass
p [1, 2, 3].class          # => Array
p({ name: "yugesh" }.class) # => Hash  (wrap in () so Ruby doesn't read {} as a block)
p (1..5).class             # => Range

puts "\n--- Big integers just work (no overflow) ---"
p (10 ** 40).class         # => Integer
p 10 ** 40                 # => 10000000000000000000000000000000000000000

puts "\n--- Truthiness: only nil and false are falsy ---"
# Everything else (0, "", []) is truthy in Ruby.
[0, "", [], nil, false].each do |value|
  puts "#{value.inspect.ljust(6)} is #{value ? 'truthy' : 'falsy'}"
end

puts "\n--- Checking types ---"
p 42.is_a?(Integer)        # => true
p 42.is_a?(Numeric)        # => true  (Integer < Numeric)
p 42.instance_of?(Numeric) # => false (exact class only)
p "hi".respond_to?(:upcase) # => true  (prefer duck typing over class checks)

puts "\n--- The object hierarchy ---"
p Integer.ancestors        # => [Integer, Numeric, Comparable, Object, Kernel, BasicObject]

# -----------------------------------------------------------------------------
# NOTE (Ruby 3.4+): string literals are chilled/frozen by default in future
# versions. Add `# frozen_string_literal: true` at the top of files to opt in
# today and get a small performance win plus immutable string constants.
# -----------------------------------------------------------------------------
