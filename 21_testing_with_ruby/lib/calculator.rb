class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    return false if b.zero?
    a/b
  end

  def square_root a
    Math.sqrt(a)
  end
end
