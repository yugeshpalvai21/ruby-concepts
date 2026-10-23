# =============================================================================
# 19d - method_missing (intercepting unknown method calls)
# =============================================================================
# When you call a method an object doesn't have, Ruby calls `method_missing`
# before raising NoMethodError. Override it to handle calls dynamically — the
# foundation of "ghost methods" (as used by OpenStruct, ActiveRecord, etc.).
# =============================================================================

class Person
  attr_accessor :name, :age

  def method_missing(method_name, *args, &block)
    # Handle any call that looks like location_* on the fly.
    if method_name.to_s.start_with?("location_")
      "dynamic answer for #{method_name}"
    else
      super   # IMPORTANT: let genuinely-missing methods raise NoMethodError
    end
  end
end

person = Person.new
person.name = "yugesh palvai"
person.age = 29

puts "--- Real methods still work normally ---"
p person.name # => "yugesh palvai"

puts "\n--- Ghost methods handled by method_missing ---"
p person.location_city    # => "dynamic answer for location_city"
p person.location_country # => "dynamic answer for location_country"

puts "\n--- Unhandled calls fall through to super and raise ---"
begin
  person.courses
rescue NoMethodError => e
  puts "raised as expected: #{e.message.split(" for ").first}"
end

# -----------------------------------------------------------------------------
# PITFALL: overriding method_missing without also defining respond_to_missing?
# makes respond_to?/method() lie about the ghost methods. See the next file.
# -----------------------------------------------------------------------------
