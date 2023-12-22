require_relative "../lib/person"

RSpec.describe Person do
  it "instantiate person class" do
    person = described_class.new
    expect(person).to be_instance_of(Person)
  end
end