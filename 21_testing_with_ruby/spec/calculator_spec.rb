# calculator_spec.rb

require 'calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  # Equality Matchers
  it 'adds two numbers' do
    result = calculator.add(3, 4)
    expect(result).to eq(7)
  end

  it 'subtracts two numbers' do
    result = calculator.subtract(8, 3)
    expect(result).to_not eq(6)
  end

  # Comparison Matchers
  it 'multiplies two numbers' do
    result = calculator.multiply(2, 5)
    expect(result).to be > 8
  end

  # Truthy and Falsy Matchers
  it 'divides two numbers' do
    result = calculator.divide(10, 2)
    expect(result).to be_truthy
  end

  it 'divides by zero' do
    result = calculator.divide(5, 0)
    expect(result).to be_falsy
  end

  # Nil Value Matcher
  it 'calculates square root' do
    result = calculator.square_root(25)
    expect(result).to_not be_nil
  end

  # Include Matcher
  it 'checks if an array includes a specific element' do
    numbers = [1, 2, 3, 4, 5]
    expect(numbers).to include(3)
  end

  # Regex Matcher
  it 'checks if a string matches a regex pattern' do
    text = 'Hello, World!'
    expect(text).to match(/World/)
  end

  # Type Matchers
  it 'checks if an object is an instance of a specific class' do
    result = calculator.add(2, 3)
    expect(result).to be_instance_of(Integer)
  end

  it 'checks if an object is an instance of a specific class or its subclass' do
    result = calculator.subtract(8, 3)
    expect(result).to be_kind_of(Numeric)
  end

  # Respond To Matcher
  it 'checks if an object responds to a specific method' do
    expect(calculator).to respond_to(:square_root)
  end
end
