# A guided tour of common RSpec matchers.
require "calculator"

RSpec.describe Calculator do
  # `subject` is an implicit `described_class.new`; `let` memoizes per example.
  subject(:calculator) { described_class.new }

  describe "#add" do
    it "sums two numbers" do
      expect(calculator.add(3, 4)).to eq(7) # eq => value equality (==)
    end
  end

  describe "#subtract" do
    it "returns the difference" do
      expect(calculator.subtract(8, 3)).to eq(5)
    end
  end

  describe "#multiply" do
    # Comparison matchers
    it "produces a larger result for larger inputs" do
      expect(calculator.multiply(2, 5)).to be > 8
      expect(calculator.multiply(2, 5)).to be_between(1, 100).inclusive
    end
  end

  describe "#divide" do
    it "returns a float quotient" do
      # Floats need be_within instead of exact eq.
      expect(calculator.divide(10, 3)).to be_within(0.01).of(3.33)
    end

    # raise_error matcher for the error path
    it "raises when dividing by zero" do
      expect { calculator.divide(5, 0) }
        .to raise_error(ArgumentError, /divide by zero/)
    end
  end

  describe "#square_root" do
    it "is not nil for a valid input" do
      expect(calculator.square_root(25)).not_to be_nil
      expect(calculator.square_root(25)).to eq(5.0)
    end

    it "raises for a negative input" do
      expect { calculator.square_root(-1) }.to raise_error(ArgumentError)
    end
  end

  # Matchers that aren't tied to a specific method.
  describe "assorted matchers" do
    it "include: membership in a collection" do
      expect([1, 2, 3, 4, 5]).to include(3)
      expect({ a: 1 }).to include(:a)
    end

    it "match: string against a regex" do
      expect("Hello, World!").to match(/World/)
    end

    it "type matchers" do
      expect(calculator.add(2, 3)).to be_an_instance_of(Integer) # exact class
      expect(calculator.subtract(8, 3)).to be_a_kind_of(Numeric) # class or subclass
    end

    it "respond_to: duck typing" do
      expect(calculator).to respond_to(:square_root)
      expect(calculator).to respond_to(:add).with(2).arguments
    end

    it "predicate matchers (be_* maps to *?)" do
      expect(10).to be_even    # calls 10.even?
      expect(0).to be_zero     # calls 0.zero?
      expect([]).to be_empty   # calls [].empty?
    end
  end
end
