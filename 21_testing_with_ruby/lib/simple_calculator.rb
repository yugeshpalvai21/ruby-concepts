# Coerces its inputs with to_i, so it accepts numeric strings too:
#   add(1, "6") => 7
# Used to show type-coercion behavior in specs.
class SimpleCalculator
  def add(a, b)      = a.to_i + b.to_i
  def subtract(a, b) = a.to_i - b.to_i
end
