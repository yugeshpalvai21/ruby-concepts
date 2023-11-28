# reference https://www.rubyguides.com/2018/01/ruby-string-methods/
# String Methods And Iterators

# one way to define string variable
str = String.new("something")
puts str

# other way to define String
puts "something"

#methods available on string objects
p str.methods.count # Gives complete class and object methods count
p str.class.methods.count # Gives only class methods count
p str.methods.count - str.class.methods.count # Gives object methods count

#most used methods on string objects
some_string = "there is no short cut to success except hardwork"

# modifying string
p some_string.upcase
p some_string.downcase
p some_string.capitalize
p some_string.reverse
p some_string.split(" ")
p some_string.length
p some_string.size

p some_string.strip
p "   sdda sdfsfs   ".strip

# Extract Data From String
p some_string[0,4] # starts from 0 index and return 4 values
p some_string[0..4] # return values between Index 0 and Index 4


# Predicate Methods
p some_string.include?("is")
p some_string.empty?
p some_string.nil?

#Blocks and Iteratios

some_string << ". is "
some_string << "a beautiful quote"
puts some_string

some_string.each_char { |letter| print letter.upcase }

puts ""
puts some_string.gsub("is", "Is")
