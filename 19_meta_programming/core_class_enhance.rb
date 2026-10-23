# =============================================================================
# 19b - ENHANCING CORE CLASSES (and doing it safely)
# =============================================================================
# You can add methods to built-in classes like Array/String/Integer. Adding is
# usually fine; OVERRIDING existing behavior globally is dangerous because every
# object in the program (and every gem) is affected.
# =============================================================================

puts "--- Adding a brand-new method (low risk) ---"
class Array
  # Product of only the numeric elements, skipping non-numbers.
  def multiply_numbers
    select { |x| x.is_a?(Numeric) }.reduce(1, :*)
  end
end
p [2, 4, 6].multiply_numbers              # => 48
p ["skip", 2, 4, "me", 6].multiply_numbers # => 48 (strings ignored, 0 respected)
p [0, 5].multiply_numbers                  # => 0  (real zeros are kept!)

puts "\n--- SAFER: refinements scope the change to a lexical region ---"
module IntegerBinary
  refine Integer do
    def to_bits = to_s(2)
  end
end

module UsesRefinement
  using IntegerBinary          # the refinement is active ONLY in this module
  def self.show(n) = n.to_bits
end
p UsesRefinement.show(5) # => "101"

# Outside the `using` scope, Integer#to_bits does NOT exist:
p 5.respond_to?(:to_bits) # => false (globally untouched — this is the win)

# -----------------------------------------------------------------------------
# WARNING: overriding a core method globally, e.g. redefining Array#sum, would
# break any code that expects the real behavior. If you must alter built-ins,
# prefer refinements (above) so the change stays local and explicit.
# -----------------------------------------------------------------------------
