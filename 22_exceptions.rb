# =============================================================================
# 22 - EXCEPTIONS & ERROR HANDLING
# =============================================================================
# Exceptions signal that something went wrong. Handle them with
# begin/rescue/ensure, raise your own, and define custom exception classes.
# =============================================================================

puts "--- Basic begin / rescue ---"
begin
  result = 10 / 0
rescue ZeroDivisionError => e
  puts "caught: #{e.message}"  # => caught: divided by 0
end

puts "\n--- Rescue specific errors, most-specific first ---"
def parse_int(str)
  Integer(str)                 # strict: raises on bad input
rescue ArgumentError
  puts "'#{str}' is not a valid integer"
  nil
end
p parse_int("42")   # => 42
p parse_int("oops") # prints message, => nil

puts "\n--- ensure always runs (cleanup) ---"
def read_resource
  puts "open resource"
  raise "boom"
rescue => e           # bare rescue catches StandardError
  puts "handled: #{e.message}"
ensure
  puts "close resource" # runs whether or not an error happened
end
read_resource

puts "\n--- retry (careful: guard against infinite loops) ---"
attempts = 0
begin
  attempts += 1
  raise "flaky" if attempts < 3
  puts "succeeded on attempt #{attempts}"
rescue
  retry if attempts < 3
end

puts "\n--- raise your own errors ---"
def withdraw(balance, amount)
  raise ArgumentError, "amount must be positive" unless amount.positive?
  raise "insufficient funds" if amount > balance
  balance - amount
end
p withdraw(100, 30) # => 70
begin
  withdraw(100, 200)
rescue => e
  puts "rejected: #{e.message}"
end

puts "\n--- Custom exception classes ---"
class ValidationError < StandardError; end
class EmptyNameError < ValidationError
  def initialize(msg = "name cannot be empty")
    super
  end
end

def validate(name)
  raise EmptyNameError if name.strip.empty?
  name
end
begin
  validate("   ")
rescue ValidationError => e   # catches EmptyNameError too (it's a subclass)
  puts "#{e.class}: #{e.message}"
end

puts "\n--- Method-level rescue (no begin needed) ---"
def safe_divide(a, b)
  a / b
rescue ZeroDivisionError
  Float::INFINITY
end
p safe_divide(10, 2) # => 5
p safe_divide(10, 0) # => Infinity

puts "\n--- Inspecting an exception ---"
begin
  raise TypeError, "wrong type"
rescue => e
  p e.class     # => TypeError
  p e.message   # => "wrong type"
  p e.is_a?(StandardError) # => true
end

# -----------------------------------------------------------------------------
# NOTE: rescue with no class catches StandardError (NOT Exception). Avoid
# `rescue Exception` — it swallows SystemExit/Interrupt and makes Ctrl-C and
# process exit misbehave. Rescue the narrowest error that makes sense.
# -----------------------------------------------------------------------------
