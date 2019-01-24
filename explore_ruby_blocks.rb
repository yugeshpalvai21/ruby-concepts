# Blocks

# A Block is a collection of code to be executed
# A Block must be wrapped in between do.. end keyword or open..close curly braces({ code })

countries = ['ind', 'usa', 'uk', 'ger','aus']
countries.each do |country| # Here We're attaching block to each method on countries object
	puts country.upcase
end
puts ""

countries.each { |country| puts country.capitalize } #other way to define block
puts ""

# Below is the way how method handles block
class Array
	def each
		i = 0
		while(i<self.length)
			yield(self[i])
			i += 1
		end
	end
end

# method that handles block

def line_controls
	puts 'First Line'
	yield
	puts 'Third Line'
end

line_controls { puts 'Second Line' }



# Lets create Our own class and deals with blocks
puts ""
class Person
	attr_accessor :first_name, :last_name, :location
	def initialize(first_name='john', last_name='doe')
		@first_name = first_name
		@last_name = last_name
	end

	def full_name
		"#{first_name.capitalize} #{last_name.capitalize}"
	end

	def greets
		if block_given?
			yield(self.full_name)
		else
			"Welcome #{self.full_name}"
		end
	end
end

person = Person.new('yugesh', 'palvai')
p person.greets
p person.greets {|name| "Hello Mr. #{name}, Have a Nice Day."}
p person.greets {|name| "Hey #{name}, How are you doing?" }

