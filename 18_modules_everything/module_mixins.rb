# =============================================================================
# 18a - MODULES AS MIXINS
# =============================================================================
# A mixin is a module whose methods are shared INTO classes via include/extend/
# prepend. This is Ruby's answer to multiple inheritance: compose behavior from
# several small modules instead of one deep class tree.
# =============================================================================

# A reusable behavior: anything that has an #each can become Walkable.
module Walkable
  def walk = "#{name} is walking"
end

module Swimmable
  def swim = "#{name} is swimming"
end

# Compose BOTH behaviors into one class (impossible with single inheritance).
class Duck
  include Walkable
  include Swimmable
  attr_reader :name
  def initialize(name) = @name = name
end

donald = Duck.new("Donald")
puts donald.walk # => Donald is walking
puts donald.swim # => Donald is swimming
p Duck.ancestors # => [Duck, Swimmable, Walkable, Object, ...]

puts "\n--- include vs extend vs prepend (all three, side by side) ---"
module Hello
  def hello = "hello from #{self.class == Class ? self : self.class}"
end

class A; include Hello; end  # instance method
class B; extend  Hello; end  # class method

p A.new.hello  # => instance-level
p B.hello      # => class-level

# prepend wins over the class's own method of the same name:
module Shout
  def speak = super.upcase
end
class Person
  prepend Shout
  def speak = "hi"
end
p Person.new.speak # => "HI"

puts "\n--- extend self: a module that is also its own utility namespace ---"
module MathUtils
  extend self            # methods become callable as MathUtils.method
  def double(n) = n * 2
  def triple(n) = n * 3
end
p MathUtils.double(5) # => 10
p MathUtils.triple(5) # => 15
