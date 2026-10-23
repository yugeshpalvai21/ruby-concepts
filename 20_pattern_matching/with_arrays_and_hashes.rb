# =============================================================================
# 20a - STRUCTURAL PATTERN MATCHING (case/in)
# =============================================================================
# `case/in` (Ruby 2.7+, stable in 3.0) matches the SHAPE of data and binds
# variables in one step. Great for parsing nested arrays/hashes and JSON-like
# structures. (Different from `case/when`, which tests values via ===.)
# =============================================================================

puts "--- Array patterns ---"
case [1, 2, 3]
in [a, b, c]
  puts "three elements: #{a}, #{b}, #{c}"
end

puts "\n--- Splat in array patterns ---"
case [1, 2, 3, 4, 5]
in [first, *middle, last]
  p first  # => 1
  p middle # => [2, 3, 4]
  p last   # => 5
end

puts "\n--- Find pattern [*, x, *] (locate inside a collection) ---"
case ["log", "ERROR: boom", "ok"]
in [*, /ERROR: (.+)/ => line, *]
  puts "found error line: #{line}"
end

puts "\n--- Hash patterns (bind by key) ---"
person = { name: "Yugesh", location: "IND" }
case person
in { name:, location: }        # shorthand: binds `name` and `location`
  puts "#{name} from #{location}"
end

puts "\n--- Nested patterns ---"
record = { name: "Yugesh", address: { city: "HYD", country: "IND" } }
case record
in { name:, address: { city:, country: } }
  puts "#{name} lives in #{city}, #{country}"
end

puts "\n--- Type + guard conditions ---"
people = [
  { name: "Asha", rank: 108 },
  { name: "Bhanu", rank: 1500 },
  { name: "Chitra", rank: 250 }
]
people.each do |p_rec|
  case p_rec
  in { name: String => n, rank: Integer => r } if r <= 250
    puts "#{n} qualifies (rank #{r})"
  else
    puts "#{p_rec[:name]} does not qualify"
  end
end

puts "\n--- Alternative patterns with | ---"
def http_status(code)
  case code
  in 200 | 201 | 204 then "success"
  in 400 | 404 | 422 then "client error"
  in 500..599        then "server error"
  else "unknown"
  end
end
p http_status(201) # => "success"
p http_status(404) # => "client error"
p http_status(503) # => "server error"

puts "\n--- Pin operator ^ matches against an EXISTING value ---"
expected = "admin"
case { role: "admin" }
in { role: ^expected }
  puts "role matches the expected value"
end

puts "\n--- One-line pattern match with => (rightward assignment) ---"
config = { host: "localhost", port: 5432 }
config => { host:, port: }   # raises NoMatchingPatternError if shape differs
puts "#{host}:#{port}"       # => localhost:5432

puts "\n--- Boolean test with `in` (no binding needed) ---"
# `expr in pattern` returns true/false. Wrap in parens when using the result.
matches_shape = ({ a: 1 } in { a: Integer })
p matches_shape                 # => true
wrong_length = ([1, 2] in [_, _, _])
p wrong_length                  # => false

puts "\n--- Custom objects via deconstruct / deconstruct_keys ---"
Point = Struct.new(:x, :y)   # Struct auto-defines both deconstruct methods
case Point.new(3, 4)
in [x, y]          # array-style, uses deconstruct
  puts "array form: #{x}, #{y}"
end
case Point.new(3, 4)
in { x:, y: }      # hash-style, uses deconstruct_keys
  puts "hash form: #{x}, #{y}"
end
