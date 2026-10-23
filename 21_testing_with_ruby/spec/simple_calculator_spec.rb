# Shows the Arrange / Act / Assert rhythm and type coercion.
require "simple_calculator"

RSpec.describe SimpleCalculator do
  subject(:calc) { described_class.new }

  it "is an instance of the described class" do
    expect(calc).to be_an_instance_of(SimpleCalculator)
  end

  describe "#add" do
    it "adds two integers" do
      expect(calc.add(2, 6)).to eq(8)
    end

    it "coerces numeric strings before adding" do
      # Arrange / Act / Assert
      result = calc.add(1, "6") # "6" is coerced via to_i
      expect(result).to eq(7)
    end
  end

  describe "#subtract" do
    it "subtracts two integers" do
      expect(calc.subtract(3, 1)).to eq(2)
    end
  end
end
