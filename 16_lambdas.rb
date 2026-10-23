# =============================================================================
# 16 - LAMBDAS
# =============================================================================
# A lambda is a special Proc with two differences:
#   1. STRICT arity  -> wrong number of arguments raises ArgumentError
#   2. `return`      -> returns only from the lambda, NOT the enclosing method
# Define one with -> (stabby lambda) or the `lambda` keyword.
# =============================================================================

puts "--- Defining lambdas ---"
multiply = ->(a, b) { a * b }   # stabby syntax (preferred)
add      = lambda { |a, b| a + b }
p multiply.call(3, 4) # => 12
p add.(3, 4)          # => 7

puts "\n--- Difference 1: lambdas are STRICT about arguments ---"
strict = ->(a, b) { [a, b] }
begin
  strict.call(1)      # too few
rescue ArgumentError => e
  puts "lambda raised: #{e.message}"
end
begin
  strict.call(1, 2, 3) # too many
rescue ArgumentError => e
  puts "lambda raised: #{e.message}"
end
# Compare: a plain proc would silently fill with nil / ignore extras (see 15).

puts "\n--- Difference 2: return semantics ---"
def with_lambda
  checker = -> { return "from lambda" }
  checker.call            # returns only from the lambda
  "from method"           # so this line is still reached
end
p with_lambda # => "from method"

def with_proc
  checker = proc { return "from proc" }
  checker.call            # returns from the WHOLE method here
  "unreachable"
end
p with_proc # => "from proc"

puts "\n--- Introspection ---"
p multiply.lambda? # => true
p multiply.arity   # => 2
optional = ->(a, b = 10) { a + b }
p optional.arity   # => -2 (negative means optional args present)

puts "\n--- Lambdas as first-class values: callbacks & pipelines ---"
double = ->(x) { x * 2 }
inc    = ->(x) { x + 1 }

# >> composes left-to-right: double THEN inc
pipeline = double >> inc
p pipeline.call(5) # => 11  ((5*2)+1)

# << composes right-to-left: inc THEN double
reverse_pipeline = double << inc
p reverse_pipeline.call(5) # => 12 ((5+1)*2)

puts "\n--- Currying (fix arguments one at a time) ---"
volume = ->(l, w, h) { l * w * h }.curry
p volume[2][3][4]  # => 24
base = volume[2]    # partially applied
p base[5][10]       # => 100

puts "\n--- Passing a lambda where a block is expected ---"
p [1, 2, 3, 4].select(&->(n) { n.even? }) # => [2, 4]

# -----------------------------------------------------------------------------
# Rule of thumb: use a lambda when you want strict, method-like behavior
# (callbacks, validations, composable functions); use a plain proc/block for
# simple iteration where leniency is convenient.
# -----------------------------------------------------------------------------
