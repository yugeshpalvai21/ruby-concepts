# Basic Method Defination
def some_method
	puts "Return Result Of Basic Method"
end

some_method

# Method With Parameters
def merit_calculator(marks) #parameters
	case marks
		when 0..34 then "Failed"
		when 35..59 then "Passed"
		when 60..70 then "Passed With Merit"
		when 70..100 then "Passed With Distinction"
		else "Invalid Score"
	end
end

puts ""
print "Please Enter Your Marks: "
input_marks = gets.chomp.to_i
result = merit_calculator(input_marks) #arguments
puts result

#Handle Default Parameter Values
puts ""
def person_details(first_name='john', last_name='Doe', location='usa')
	"Hello Mr. #{first_name.capitalize} #{last_name.capitalize}, You're From #{location.upcase}"
end

puts person_details()
puts person_details('yugesh', 'palvai', 'ind')

#Handle Annonumous arguments of method call
puts ""

def full_name(first_name, *middle_name, last_name)
	p middle_name
	processed_middle_name = middle_name.map(&:capitalize).join(" ")
	"#{first_name.capitalize} #{processed_middle_name} #{last_name.capitalize}"
end

puts full_name('yugesh', 'my','middle','name','palvai')

#Handle Hashes As Parameters
puts ""
puts "Article Details:"
def article_params(article={})
	puts "Title: #{article[:title]}"
	puts "Description: #{article[:description]}"
	puts "User: #{article[:user]}"
	article
end

p article_params(title: 'Some Title', description: 'Some Description', user: 'yugesh')


