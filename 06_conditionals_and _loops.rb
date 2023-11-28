# IF - ELSE Condition
print "Please enter Your Age: "
age = gets.chomp.to_i
if (age >= 18)
	puts "Welcome To Our App."
else
	puts "You're not authorized to use this app"
end

#Using Ternory Operator

puts age >= 18 ? "Welcome To Our App." : "You're not authorized to use this app"

#Multi Else Conditions
puts ""
print "Please enter your score: "
score = gets.chomp.to_i

if score >= 0 && score <= 40
	puts "Failed"
elsif score > 40 && score <= 60
	puts "Passed"
elsif score > 60 && score <= 70
	puts "Passed With Merit"
elsif score > 70 && score <= 100
	puts "Passed With Distinction"
else
	puts "Invalid Score"
end

# Using Case Statement
result = case score
	when 0..40
		"Fail"
	when 41..60
		"Pass"
	when 61..70
		"Pass With Merit"
	when 70..100
		"Pass With Distinction"
	else
		"Invalid Score"
end
puts result


# Using case..when..then statement
puts case score
	when 0..40 then "Failed"
	when 41..60 then "Passed"
	when 61..70 then "Passed With Merit"
	when 70..100 then "Passed With Distinction"
	else "Invalid Score"
end 

# IF NOT EQUALS CONDITION
puts ""
print "Enter Your Number: "
number = gets.chomp.to_i
if number != 55
	puts "Play Again"
end

#using unless statement

unless number == 55
	puts "FAILED!!!! PLAY AGAIN"
end

# LOOPS
# While
puts ""
print "Please Enter Number For Multiplication Table: "
m_number = gets.chomp.to_i
i = 1
while i<=10
	puts "#{m_number} * #{i} = #{m_number * i}"
	i+=1 
end

#For Loop
puts ""
for i in 1..10 
	puts "#{i} * #{m_number} = #{m_number * i}"
end	

# While Not
puts " "
print "Lets' Play a Game - Choose Your Number between 1..15: "
rand_number = gets.chomp.to_i
# while rand_number != 12
# 	puts "You Entered Wrong Number -  Please Try Again"
# 	print "Choose Your Number between 1..15: "
# 	rand_number = gets.chomp.to_i
# end

# Using until statement
until rand_number == 12
	puts "You Entered Wrong Number -  Please Try Again"
	print "Choose Your Number between 1..15: "
	rand_number = gets.chomp.to_i
end

# FIZZ BUZZ PROGRAMM
puts ""
puts "Lets's Play With Fizz Buzz Programm: "
1.upto(100) do |i|
  if i % 5 == 0 and i % 3 == 0
    puts "FizzBuzz"
  elsif i % 5 == 0
    puts "Buzz"
  elsif i % 3 == 0
    puts "Fizz"
  else
    puts i
  end
end

#using case statement
1.upto(100) do |i|
	case 0
	when i%15 then puts "FizzBuzz"
	when i%5 then puts "Buzz"
	when i%3 then puts "Fizz"
	else puts i
	end
end

