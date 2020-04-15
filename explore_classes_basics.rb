#Defining Empty Class
class User
end

user1 = User.new
p user1 
p user1.class
p user1.class.superclass
p user1.class.ancestors
p user1.methods.count # Instance Methods
p user1.class.methods.count #Class Methods

#Defining Class With Object Methods
puts ""
class Welcome
	def greets
		"Hi, Welcome To Our Hotel"
	end
	def address
		"3402, USA"
	end
end

hotel = Welcome.new
p hotel
p hotel.greets
p hotel.address

#Defining Class With Constructor Method
puts ""
class Customer
	def initialize(first_name='yugesh', last_name='palvai')
		@first_name = first_name
		@last_name = last_name
	end

	def full_name
		"#{@first_name} #{@last_name}"
	end
end

customer1 = Customer.new
p customer1
p customer1.full_name

customer2 = Customer.new('John', 'Doe')
p customer2.full_name

#Defining Class With Getters and Setters
puts ""
class Customer
	def initialize(first_name='yugesh', last_name='palvai')
		@first_name = first_name
		@last_name = last_name
	end

	def first_name=(name)
		@first_name = name
	end

	def last_name=(name)
		@last_name = name
	end

	def first_name
		@first_name
	end

	def last_name
		@last_name
	end
	
	def full_name
		"#{@first_name} #{@last_name}"
	end
end

customer = Customer.new
p customer.first_name
p customer.last_name
p customer.full_name

customer.first_name = 'John'
customer.last_name = 'Doe'
p customer.first_name
p customer.last_name
p customer.full_name

#Defining Class With Getters and Setters using ruby inbuilt methods
puts ""
class Customer
	attr_reader :first_name
	attr_writer :first_name
	attr_accessor :last_name

	def initialize(first_name='yugesh', last_name='palvai')
		@first_name = first_name
		@last_name = last_name
	end

	def full_name
		"#{@first_name} #{@last_name}"
	end
end
customer = Customer.new
p customer.first_name
p customer.last_name
p customer.full_name

customer.first_name = 'John'
customer.last_name = 'Doe'
p customer.first_name
p customer.last_name
p customer.full_name



####### SOme MORe STUff

class Person
	attr_reader :name
	def initialize name="unknown"
		@name = name
	end

	def full_name
		"Yugesh Palvai"
	end
end
puts ""
person = Person.new
# puts person.name
person2 = Person.allocate
# puts person2.name
puts person.full_name
puts person.send :full_name