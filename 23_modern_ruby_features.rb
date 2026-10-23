# =============================================================================
# 23 - MODERN RUBY FEATURES (3.0 -> 4.0)
# =============================================================================
# A tour of newer syntax and classes worth knowing when refreshing from an
# older Ruby. Each item notes the version it arrived in. This file runs on
# Ruby 3.0+; a couple of 4.0-only notes are shown as comments.
# =============================================================================

puts "--- Endless method definitions (3.0) ---"
def square(n) = n * n
p square(9) # => 81

puts "\n--- Hash shorthand / value omission (3.1) ---"
name = "Yugesh"
role = "engineer"
# { name:, role: } is shorthand for { name: name, role: role }
person = { name:, role: }
p person # => {name: "Yugesh", role: "engineer"}

def coords(x:, y:) = [x, y]
x, y = 3, 4
p coords(x:, y:) # => [3, 4] (argument shorthand too)

puts "\n--- One-line pattern matching (3.0) ---"
config = { host: "localhost", port: 5432 }
config => { host:, port: }        # rightward assignment / destructuring
puts "#{host}:#{port}"            # => localhost:5432
is_match = ({ a: 1 } in { a: Integer }) # wrap the `in` test in parens
p is_match                        # => true (boolean test)

puts "\n--- Numbered & `it` block parameters ---"
p [1, 2, 3].map { _1 * 10 }       # _1.._9 (2.7+)  => [10, 20, 30]
# NOTE (3.4+): a single param can be referred to as `it`:
#   [1, 2, 3].map { it * 10 }

puts "\n--- Argument forwarding ... (2.7/3.0) ---"
def log(...) = square(...)
p log(6) # => 36

puts "\n--- Safe navigation &. (2.3) ---"
user = nil
p user&.upcase        # => nil (no NoMethodError)
p "hi"&.upcase        # => "HI"

puts "\n--- then / yield_self for pipelines (2.5/2.6) ---"
result = 5.then { |n| n + 1 }.then { |n| n * 2 }
p result # => 12

puts "\n--- Beginless & endless ranges (2.6/2.7) ---"
p (..5).include?(3)   # => true (beginless)
p (5..).include?(99)  # => true (endless)
scores = [40, 75, 92]
p scores.map { |s| (70..).cover?(s) ? "pass" : "fail" } # => ["fail", "pass", "pass"]

puts "\n--- Data: immutable value objects (3.2) ---"
Point = Data.define(:x, :y) do
  def distance_to_origin = Math.sqrt(x**2 + y**2)
end
pt = Point.new(x: 3, y: 4)
p pt.x                      # => 3
p pt.distance_to_origin     # => 5.0
p pt.with(y: 0)             # => #<data Point x=3, y=0> (copy with changes)
# Data instances are immutable: pt.x = 10 would raise NoMethodError.

puts "\n--- Set is efficient & (4.0) first-class ---"
require "set"               # NOTE (4.0): Set reimplemented; still require on 3.x
s = Set[1, 2, 3]
s << 2                      # duplicates ignored
p s.include?(2)             # => true
p (Set[1, 2, 3] & Set[2, 3, 4]).to_a.sort # => [2, 3] (intersection)

puts "\n--- Comparable + <=> for free comparisons ---"
Version = Data.define(:major, :minor) do
  include Comparable
  def <=>(other) = [major, minor] <=> [other.major, other.minor]
end
p Version.new(major: 2, minor: 0) > Version.new(major: 1, minor: 9) # => true

# -----------------------------------------------------------------------------
# Ruby 4.0 headline items (released Dec 2025) — mostly transparent to this code:
#   * ZJIT: a new experimental JIT compiler (runtime perf, no syntax change)
#   * Ruby::Box: an experimental isolation layer
#   * Ractor port API: reworked concurrency primitives
#   * Pathname and Set promoted to core
#   * Logical operators (&& || and or) may START a continuation line
# See: https://rubyreferences.github.io/rubychanges/4.0.html
# -----------------------------------------------------------------------------
