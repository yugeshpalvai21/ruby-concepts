# =============================================================================
# 07 - CASE WITH RANGES
# =============================================================================
# `case/when` uses the `===` ("case equality") operator under the hood.
# For a Range, `(0..18) === age` means "does age fall inside the range?".
# =============================================================================

puts "--- Age brackets (note: ranges must NOT overlap) ---"
def life_stage(age)
  case age
  when 0..12   then "Child"
  when 13..17  then "Teenager"
  when 18..64  then "Adult"
  when 65..     then "Senior"   # beginless/endless ranges (Ruby 2.6+/2.7+)
  else "Invalid age"
  end
end

[-1, 5, 15, 30, 70].each do |age|
  puts "#{age.to_s.rjust(3)} => #{life_stage(age)}"
end
# -3  => Invalid age (the -1 row)
#   5 => Child
#  15 => Teenager
#  30 => Adult
#  70 => Senior

puts "\n--- Inclusive (..) vs exclusive (...) ranges ---"
p (1..5).to_a    # => [1, 2, 3, 4, 5]  includes 5
p (1...5).to_a   # => [1, 2, 3, 4]     excludes 5

puts "\n--- case with NO subject (reads like elsif) ---"
temp = 30
summary =
  case
  when temp < 0   then "freezing"
  when temp < 15  then "cold"
  when temp < 28  then "mild"
  else "hot"
  end
p summary # => "hot"

puts "\n--- case matches on type too (=== with a Class) ---"
def describe(value)
  case value
  when Integer then "an integer"
  when String  then "a string"
  when Array   then "an array"
  when nil     then "nothing"
  else "something else"
  end
end
p describe(42)      # => "an integer"
p describe("hi")    # => "a string"
p describe([1, 2])  # => "an array"
p describe(nil)     # => "nothing"

puts "\n--- case with a Regexp (=== runs the match) ---"
def classify_token(token)
  case token
  when /\A\d+\z/        then "number"
  when /\A[a-z]+\z/i    then "word"
  else "mixed"
  end
end
p classify_token("123")  # => "number"
p classify_token("ruby") # => "word"
p classify_token("r2d2") # => "mixed"
