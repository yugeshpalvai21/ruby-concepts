# =============================================================================
# 06 - CONDITIONALS & LOOPS
# =============================================================================
# Note: this file uses fixed sample values so it runs top-to-bottom without
# pausing for input. To make it interactive, swap a line like:
#     age = 20
# for:
#     print "Enter age: "; age = gets.chomp.to_i
# =============================================================================

puts "--- if / elsif / else ---"
age = 20
if age >= 18
  puts "Adult"
elsif age >= 13
  puts "Teenager"
else
  puts "Child"
end

puts "\n--- Modifier if / unless (one-liners) ---"
puts "You can vote" if age >= 18
puts "Minor" unless age >= 18

puts "\n--- Ternary operator ---"
puts(age >= 18 ? "Welcome" : "Access denied")

puts "\n--- Everything is an expression (if returns a value) ---"
label = if age >= 18 then "adult" else "minor" end
p label # => "adult"

puts "\n--- case / when for grading (expression form) ---"
score = 72
grade =
  case score
  when 0..40   then "Fail"
  when 41..60  then "Pass"
  when 61..70  then "Merit"
  when 71..100 then "Distinction"
  else "Invalid"
  end
p grade # => "Distinction"

puts "\n--- && vs 'and' (precedence matters) ---"
# Prefer && / || in boolean expressions. 'and' / 'or' have very low precedence
# and are best reserved for control flow (do_this or raise).
p (true && false) # => false
logged_in = true
admin = false
puts "show panel" if logged_in && admin == false

# -----------------------------------------------------------------------------
# NOTE (Ruby 4.0): a boolean expression may now START a line with && / || / and
# / or, so long chains read cleanly:
#     eligible = base_check
#       && extra_check
#       || admin_override
# (On Ruby 3.x keep the operator at the end of the previous line.)
# -----------------------------------------------------------------------------

puts "\n--- while loop ---"
i = 1
while i <= 3
  puts "while #{i}"
  i += 1
end

puts "\n--- until loop (while NOT) ---"
countdown = 3
until countdown.zero?
  puts "until #{countdown}"
  countdown -= 1
end

puts "\n--- loop with break / next ---"
n = 0
loop do
  n += 1
  next if n.even?   # skip evens
  break if n > 5    # stop
  puts "loop #{n}"  # prints 1, 3, 5
end

puts "\n--- Prefer iterators over raw loops ---"
# `for` exists but leaks its variable and is rarely idiomatic; use each/times.
3.times { |x| print "#{x} " }           # => 0 1 2
puts
(1..3).each { |x| print "#{x} " }       # => 1 2 3
puts
1.step(10, 3) { |x| print "#{x} " }     # => 1 4 7 10
puts

puts "\n--- FizzBuzz (classic) ---"
(1..15).each do |num|
  line =
    if    (num % 15).zero? then "FizzBuzz"
    elsif (num % 3).zero?  then "Fizz"
    elsif (num % 5).zero?  then "Buzz"
    else  num.to_s
    end
  puts line
end
