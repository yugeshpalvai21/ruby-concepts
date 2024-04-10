def filter_age age
  case age
  when 0..18 then 'Minor'
  when 19..50 then 'Adult'
  when 50..60 then 'Senior'
  else 'Not Applicable'
  end
end

print "Please enter your age > "
input_age = gets.chomp.to_i
puts filter_age input_age