# A small calculator used to demonstrate a broad range of RSpec matchers.
class Calculator
  def add(a, b)       = a + b
  def subtract(a, b)  = a - b
  def multiply(a, b)  = a * b

  # fdiv gives a Float result (10 / 3 => 3.333..., not 3), and dividing by
  # zero raises a clear error instead of silently returning false.
  def divide(a, b)
    raise ArgumentError, "cannot divide by zero" if b.zero?

    a.fdiv(b)
  end

  def square_root(a)
    raise ArgumentError, "cannot sqrt a negative number" if a.negative?

    Math.sqrt(a)
  end
end
