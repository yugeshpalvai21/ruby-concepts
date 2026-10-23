# =============================================================================
# 19e - method_missing WITHOUT super (and why that's a trap)
# =============================================================================
# This version returns a friendly message for EVERY unknown method and never
# calls super. It demonstrates the two problems that creates:
#   1. genuinely missing methods no longer raise (bugs get swallowed)
#   2. respond_to? still returns false, so the object "lies" about itself
# The fix is in respond_to_missing.rb.
# =============================================================================

class Person
  attr_accessor :name, :age

  def method_missing(method_name, *args, &block)
    "no method named '#{method_name}' on #{self.class}"
  end
end

person = Person.new
person.name = "yugesh palvai"

puts "--- Real method ---"
p person.name           # => "yugesh palvai"

puts "\n--- Any unknown call returns a message instead of raising ---"
p person.location_first # => "no method named 'location_first' on Person"
p person.total_nonsense # => also "handled" — even typos get swallowed (BAD)

puts "\n--- Problem: respond_to? disagrees with method_missing ---"
p person.respond_to?(:name)            # => true  (a real method)
p person.respond_to?(:location_first)  # => false (but we DO handle it! -> inconsistent)
