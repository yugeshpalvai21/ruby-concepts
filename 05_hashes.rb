# source => http://www.rubycommunity.org/articles/everything-about-ruby-hashes-beginners-guide

# Defining Hash
name = {'first_name' => 'yugesh', 'last_name' => 'palvai'}
p name

info = {designation: 'SE', location: 'IND'}
p info


product = Hash.new('not found') #Defining Default Value for any key
p product
p product['title']

#extract data from hashes
p name['first_name']
p name['middle_name']
p name[:last_name]

p info[:designation]
p info['location']

#methods available on hash objects
puts ""
p name.keys
p name.values
p info.has_key?(:designation)
p name.has_value?('palvai')
p name.fetch('middle_name', 'Not Found')
p name.length
p name.to_a
p product.empty?
p product.store(:id, 201)
p product


#code blocks and iterations
puts ''
details =  name.merge(info)
details.each {|k, v| puts "#{k.upcase}: #{v.capitalize}"} 
p details.map {|k, v| [k, v]}
p name.sort



