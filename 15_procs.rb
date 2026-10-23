# =============================================================================
# 15 - PROCS
# =============================================================================
# A Proc turns a block into a reusable, storable OBJECT. You call it with
# .call (or .() or []). Procs are closures: they capture surrounding variables.
# =============================================================================

puts "--- Creating and calling a proc ---"
greeter = Proc.new { |name| "Hello, #{name}!" }
p greeter.call("Yugesh") # => "Hello, Yugesh!"
p greeter.("Asha")       # => "Hello, Asha!" (shorthand)
p greeter["Bob"]         # => "Hello, Bob!"  (bracket shorthand)

# `proc { }` is the common shorthand for Proc.new { }
doubler = proc { |n| n * 2 }
p doubler.call(21) # => 42

puts "\n--- Procs are closures (they remember their surroundings) ---"
def make_counter
  count = 0
  proc { count += 1 }   # captures the local `count`
end
counter = make_counter
p counter.call # => 1
p counter.call # => 2
p counter.call # => 3

puts "\n--- Passing a proc as a block with & ---"
def run(value)
  yield(value)
end
square = proc { |n| n * n }
p run(5, &square) # => 25   (& converts the proc into the block)

puts "\n--- & also turns a SYMBOL into a block (symbol-to-proc) ---"
p %w[a b c].map(&:upcase)     # => ["A", "B", "C"]
p ["10", "20"].map(&:to_i)    # => [10, 20]
# &:upcase is shorthand for { |x| x.upcase }

puts "\n--- Storing procs in data structures (poor man's dispatch table) ---"
operations = {
  add: proc { |a, b| a + b },
  sub: proc { |a, b| a - b },
  mul: proc { |a, b| a * b }
}
p operations[:add].call(2, 3) # => 5
p operations[:mul].call(2, 3) # => 6

puts "\n--- Proc is lenient about arguments ---"
pr = proc { |a, b| [a, b] }
p pr.call(1)        # => [1, nil]  (missing arg -> nil, no error)
p pr.call(1, 2, 3)  # => [1, 2]    (extra args ignored)
p pr.arity          # => 2
p pr.lambda?        # => false     (this is a proc, not a lambda -> see 16)
