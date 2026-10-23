# Demonstrates describe/context grouping, hooks, shared data, and mocks.
require "person"

RSpec.describe Person do
  # `subject` defaults to described_class.new (age: 0 here).
  let(:minor) { described_class.new(age: 16) }
  let(:adult) { described_class.new(age: 19) }

  describe "defaults" do
    it "starts at age 0" do
      expect(subject.age).to eq(0)
    end
  end

  describe "#major?" do
    context "when 18 or older" do
      it { expect(adult.major?).to be(true) } # one-liner example
    end

    context "when under 18" do
      it { expect(minor.major?).to be(false) }
    end
  end

  describe "#can_drink?" do
    # before hook runs before each example in this group.
    before { subject.age = starting_age }
    let(:starting_age) { 0 }

    context "with the default age" do
      it "cannot drink" do
        expect(subject.can_drink?).to be(false)
      end
    end

    context "when exactly 21" do
      let(:starting_age) { 21 } # override the let used by the before hook
      it "can drink" do
        expect(subject.can_drink?).to be(true)
      end
    end

    context "when 20" do
      let(:starting_age) { 20 }
      it "cannot drink" do
        expect(subject.can_drink?).to be(false)
      end
    end
  end

  describe "#notify (mocks & message expectations)" do
    it "sends the birthday message to the messenger collaborator" do
      person = described_class.new(age: 30)
      messenger = double("Messenger") # a test double / mock

      # Expect deliver to be called once with a message mentioning the age.
      expect(messenger).to receive(:deliver).with(a_string_including("30")).once

      person.notify(messenger)
    end

    it "can stub a return value on a double" do
      messenger = double("Messenger")
      allow(messenger).to receive(:deliver).and_return(:sent)

      person = described_class.new(age: 40)
      expect(person.notify(messenger)).to eq(:sent)
    end
  end
end
