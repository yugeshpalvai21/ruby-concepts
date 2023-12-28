require "person"

RSpec.describe Person do
  let(:person_below_eighteen) { described_class.new(age: 16) }
  let(:person_above_eighteen) { described_class.new(age: 19) }

  it "instantiate person with default age and access specifier" do
    expect(subject).to be_instance_of(Person)
    expect(subject.age).to eql 0
  end

  it "instantiate person with given age and returns it" do
    expect(person_below_eighteen.age).to eql(16)
  end

  describe "#is_major?" do
    it "returns true when pesron is above 18 years old" do
      expect(person_above_eighteen.is_major?).to be true
    end

    it "returns false when pesron is below 18 years old" do
      expect(person_below_eighteen.is_major?).to be false
    end
  end

  describe "#can_drink?" do
    it "returns false with default user age" do
      expect(subject.can_drink?).to be false
    end

    it "returns true when user is above 21 years old" do
      subject.age = 21
      
      expect(subject.can_drink?).to be true
    end

    it "returns false when user is below 21 years old" do
      subject.age = 20

      expect(subject.can_drink?).to be false
    end
  end
end