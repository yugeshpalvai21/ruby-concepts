def filter_age age
  case age
  when 0..18 then 'Minor'
  when 19..50 then 'Adult'
  when 50..60 then 'Senior'
  else 'Not Applicable'
  end
end

puts filter_age 25