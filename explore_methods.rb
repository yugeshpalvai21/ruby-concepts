# Basic Method Defination
def some_method
	puts "Return Result Of Basic Method"
end

some_method

# Method With  Annanymous Parameters
def merit_calculator(marks) #parameters
	case marks
		when 0..34 then "Failed"
		when 35..59 then "Passed"
		when 60..70 then "Passed With Merit"
		when 70..100 then "Passed With Distinction"
		else "Invalid Score"
	end
end

result = merit_calculator(55) #arguments
puts result

#Handle Default Annanymous Parameter Values
puts ""
def person_details(first_name='john', last_name='Doe', location='usa')
	"Hello Mr. #{first_name.capitalize} #{last_name.capitalize}, You're From #{location.upcase}"
end

puts person_details
puts person_details('yugesh', 'palvai', 'ind')

# Handle named parameters (keyword arguments)

def description(name: 'default', title:, rank:)
	puts "#{name} has #{title} with #{rank} rank"
end

description(title: "sdfsdf", rank: 15)

# Handle Annonumous arguments of method call
def full_name(first_name, *middle_name, last_name)
	p middle_name
	processed_middle_name = middle_name.map(&:capitalize).join(" ")
	"#{first_name.capitalize} #{processed_middle_name} #{last_name.capitalize}"
end

puts full_name('yugesh', 'my','middle','name','palvai')
puts full_name('dfgdf', 'dfgdfg')


#Handle Hashes As Parameters
def article_params(**article)
	puts article.class
	article
end

p article_params(title: 'Some Title', description: 'Some Description', user: 'yugesh')


# blocks and yields
def my_method
  puts "Start of method"
  yield if block_given?
  puts "End of method"
end

my_method do
  puts "Inside the block"
end


