require 'simple_calculator'

RSpec.describe SimpleCalculator do
  it "instantiate SC class" do
    # calc = described_class.new
    expect(subject).to be_instance_of(SimpleCalculator) 
  end
  
  it "returns result for addition of two values" do
    calc = described_class.new
    addition = calc.add(1, "6")

    expect(addition).to eql(7)
  end
  it "returns result for substraction of two values"
end