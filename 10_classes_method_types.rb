# Class Methods - Public, Private, Protected

class Customer
	attr_accessor :first_name, :last_name, :location, :rank

	def initialize(first_name, last_name, location, rank)
		@first_name = first_name
		@last_name = last_name
		@location = location
		@rank = rank
	end

	def greets #public method
		"Hello Mr. #{full_name}, You're From #{location}" 
	end

	def comapare_ranking(other_customer)
		self.rank > other_customer.rank ? "High Rank" : "Low Rank" 
	end

	private

	def full_name
		"#{first_name} #{last_name}"
	end

	protected

	def rank
		@rank
	end
end

customer = Customer.new('yugesh', 'palvai', 'ind', 101)
puts customer.greets
#puts customer.full_name   # Don't Call Private Methods on object it self

other_customer = Customer.new('john', 'doe', 'ind', 121)
puts customer.comapare_ranking(other_customer)
puts other_customer.comapare_ranking(customer)