# pattern matching with Array
digits = [1,2,3]

case digits
in [a,b,c]
  puts "a: #{a}, b: #{b}, c: #{c}"
else
  puts "No Match Found"
end


# pattern matching with hashes

person = {name: "Yugesh", location: "IND"}

case person
in {name: a, location: b}
  puts "Match found - Name: #{a}, location: #{b}"
else
  puts "No Match Found"
end


# pattern matching with nested hashes

person_two = {name: "Yugesh", location: { city: "HYD", country: "IND"}}

case person_two
in {name: a, location: {city: b, country: c}}
  puts "Match found - Name: #{a}, city: #{b}"
else
  puts "No Match Found"
end


# conditional pattern matching

example_hash = [
  { name: "Yugesh", code: "1100", rank: 108 },
  { name: "name_two", code: "1100", rank: 1500 },
  { name: "Yugesh", code: "1100", rank: 250 },
]

example_hash.each do |person|
  case person
  in {name: a, code: b, rank: c} if c <= 250
    puts "Match Found - Name: #{a}, Rank: #{c}}"
  else
    puts "No Match Found"
  end
end 

