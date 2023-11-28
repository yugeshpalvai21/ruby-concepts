# Using =~ for pattern matching
string = "Hello, World!"

# Check if the string contains the word "World"
if string =~ /World/
  puts "Match found!"
else
  puts "No match found."
end


# we can also use the result of =~ to get the index of the first match:
# Get the index of the first match
index = string =~ /World/

if index
  puts "Match found at index #{index}."
else
  puts "No match found."
end
