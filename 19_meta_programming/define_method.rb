# =============================================================================
# 19c - define_method (generating methods dynamically)
# =============================================================================
# Instead of writing many near-identical methods by hand, generate them in a
# loop. Each generated method closes over the loop variable.
# =============================================================================

class Shape
  PI = 3.14159

  # Map a shape name to a lambda that computes its area from a details hash.
  AREAS = {
    square:    ->(d) { d[:side] ** 2 },
    rectangle: ->(d) { d[:width] * d[:length] },
    circle:    ->(d) { PI * (d[:radius] ** 2) }
  }.freeze

  # Generate square_area / rectangle_area / circle_area methods.
  AREAS.each do |name, formula|
    define_method("#{name}_area") do |details = {}|
      formula.call(details).round(2)
    end
  end
end

shape = Shape.new
p shape.square_area(side: 4)             # => 16.0
p shape.rectangle_area(width: 3, length: 5) # => 15.0
p shape.circle_area(radius: 2)           # => 12.57

puts "\n--- The generated methods are real methods ---"
p shape.respond_to?(:square_area)    # => true
p shape.respond_to?(:rectangle_area) # => true
p shape.respond_to?(:triangle_area)  # => false (never generated)

puts "\n--- define_singleton_method adds ONE method to a single object/class ---"
config = Object.new
config.define_singleton_method(:env) { "production" }
p config.env # => "production"

puts "\n--- Generating attribute-like readers dynamically ---"
class Settings
  def initialize(data) = @data = data

  %i[host port user].each do |key|
    define_method(key) { @data[key] }
  end
end
s = Settings.new(host: "localhost", port: 5432, user: "admin")
p s.host # => "localhost"
p s.port # => 5432
