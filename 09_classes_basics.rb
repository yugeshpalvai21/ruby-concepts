# =============================================================================
# 09 - CLASSES: THE BASICS
# =============================================================================
# A class is a blueprint for objects. Instances hold state in @instance
# variables and expose behavior through methods.
# =============================================================================

puts "--- An empty class still inherits a lot ---"
class User
end

u = User.new
p u.class              # => User
p u.class.superclass   # => Object
p User.ancestors       # => [User, Object, Kernel, BasicObject]

puts "\n--- initialize sets up state; methods expose behavior ---"
class Customer
  def initialize(first_name = "yugesh", last_name = "palvai")
    @first_name = first_name   # @ivars live on each instance
    @last_name  = last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end

p Customer.new.full_name                # => "yugesh palvai"
p Customer.new("John", "Doe").full_name # => "John Doe"

puts "\n--- attr_* generate getters/setters for you ---"
class Product
  # attr_reader  -> getter only
  # attr_writer  -> setter only
  # attr_accessor -> both
  attr_accessor :name, :price
  attr_reader :id

  def initialize(id:, name:, price:)   # keyword args read nicely at the call site
    @id = id
    @name = name
    @price = price
  end
end

item = Product.new(id: 1, name: "Keyboard", price: 1999)
p item.name          # reader
item.price = 1499    # writer
p item.price         # => 1499
# item.id = 2        # NoMethodError: id has no writer (attr_reader)

puts "\n--- to_s and inspect make objects print nicely ---"
class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s = "(#{x}, #{y})"          # used by puts and string interpolation
  def inspect = "#<Point #{x},#{y}>" # used by p and in the console
end

pt = Point.new(3, 4)
puts pt   # => (3, 4)      (to_s)
p pt      # => #<Point 3,4> (inspect)

puts "\n--- Defining value equality with == ---"
class Money
  attr_reader :cents

  def initialize(cents) = @cents = cents

  def ==(other)
    other.is_a?(Money) && cents == other.cents
  end
end
p Money.new(500) == Money.new(500) # => true (same value)
p Money.new(500) == Money.new(100) # => false

puts "\n--- Freezing makes an object immutable ---"
FROZEN = "constant".freeze
p FROZEN.frozen? # => true

puts "\n--- send can call methods dynamically (even private ones) ---"
class Greeter
  def hello = "hi!"
end
p Greeter.new.send(:hello)        # => "hi!"
p Greeter.new.public_send(:hello) # => "hi!" (safer: respects visibility)
