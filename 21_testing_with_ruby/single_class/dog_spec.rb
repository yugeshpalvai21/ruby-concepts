require_relative 'dog'

RSpec.describe Dog do
	describe '#bark' do
		it 'returns bow' do
			expect(subject.bark).to eq('bow')
		end
	end

	describe '#hungry?' do
		context 'when hunger_lever grater than 5' do
			subject { described_class.new(6) }
			it 'returns true' do
				expect(subject).to be_hungry
			end
		end

		context 'when hunger_lever is less than or equal to 5' do
			subject { described_class.new(5) }
			it 'returns false ' do
				expect(subject).to_not be_hungry
			end
		end
	end

	describe '#feed' do
		subject { described_class.new(7) }
		it 'returns false for hungry? when we feed dog' do
			subject.feed
			expect(subject).not_to be_hungry
		end
	end
end