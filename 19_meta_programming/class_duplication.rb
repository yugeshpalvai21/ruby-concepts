# =============================================================================
# 19a - OPEN CLASSES (reopening / redefining)
# =============================================================================
# Ruby classes are "open": you can reopen any class anywhere and add or REPLACE
# methods. The most recent definition wins. Powerful, but easy to abuse.
# =============================================================================

class Person
  def first_name = "(empty)"
end
p Person.new.first_name # => "(empty)"

# Reopen and REPLACE the method entirely:
class Person
  def first_name = "Yugesh"
end
p Person.new.first_name # => "Yugesh"

# Reopen and ADD a new method (the old one stays):
class Person
  def greeting = "Hi, #{first_name}"
end
p Person.new.greeting # => "Hi, Yugesh"

puts "\n--- Extending (not replacing) with alias_method ---"
# Keep the old behavior around and build on top of it.
class Person
  alias_method :plain_name, :first_name
  def first_name = "Mr. #{plain_name}"
end
p Person.new.first_name # => "Mr. Yugesh"
p Person.new.plain_name # => "Yugesh"

puts "\n--- Safer alternative: prepend + super (wrap instead of replace) ---"
module Formal
  def first_name = "Sir #{super}"   # super calls the original
end
class Person
  prepend Formal
end
p Person.new.first_name # => "Sir Mr. Yugesh"

# -----------------------------------------------------------------------------
# NOTE: reopening core classes globally is risky (see monkey_patching.rb).
# For scoped, safer changes prefer `refinements` (`refine`/`using`).
# -----------------------------------------------------------------------------
