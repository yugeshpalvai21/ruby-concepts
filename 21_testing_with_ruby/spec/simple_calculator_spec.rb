require 'simple_calculator'

RSpec.describe SimpleCalculator do
  # Arrange
  let(:calc) { subject }

  it "instantiate SC class" do
    # calc = described_class.new
    expect(subject).to be_instance_of(SimpleCalculator) 
  end
  
  it "returns result for addition of two values" do
    # Act
    addition = calc.add(1, "6")

    # Assert
    expect(addition).to eql(7)
  end
  
  it "returns result for substraction of two values" do
    sub = calc.substaction(3, 1)

    expect(sub).to eql(2)
  end
end