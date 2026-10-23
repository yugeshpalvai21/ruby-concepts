# =============================================================================
# 19f - respond_to_missing? (the correct companion to method_missing)
# =============================================================================
# Always pair method_missing with respond_to_missing?. Then respond_to? tells
# the truth AND `object.method(:name)` works for ghost methods too.
# =============================================================================

class Person
  attr_accessor :name, :age

  def method_missing(method_name, *args, &block)
    if handles?(method_name)
      "dynamic answer for #{method_name}"
    else
      super
    end
  end

  # Ruby calls this from respond_to? for unknown methods.
  def respond_to_missing?(method_name, include_private = false)
    handles?(method_name) || super
  end

  private

  def handles?(method_name)
    method_name.to_s.start_with?("location_")
  end
end

person = Person.new

puts "--- respond_to? is now consistent with method_missing ---"
p person.respond_to?(:name)           # => true
p person.respond_to?(:location_first) # => true  (correct now!)
p person.respond_to?(:unknown)        # => false

puts "\n--- The ghost method works ---"
p person.location_first # => "dynamic answer for location_first"

puts "\n--- Bonus: #method now works for ghost methods too ---"
m = person.method(:location_city)   # would fail without respond_to_missing?
p m.call                            # => "dynamic answer for location_city"
