puts "Definging Arrays"
# method1 to create new array
details = ['yugesh', 'palvai']
p details
details = []
details[0] = 'yugesh'
details[1] = 'palvai'
p details

#method2
info = Array.new(2, 'yugesh') #length and value
p info

#method3

numbers = Array.[](1,2,3,4,5)
p numbers

numbers = Array[1,2,3,4,5]
p numbers

numbers = Array(0..9)
p numbers

#Know All Array Class and Object Methods
puts ""
puts "Methods Count On Arrays"
p details.methods.count
p details.class.methods.count
p details.methods.count - details.class.methods.count

#Array object methods extract data from array
numbers = [*1..10]
puts ""
puts "Extact Data From Arrays"
p details[0]
p details.push("engineer")
p details.insert(2,"software")
p numbers[-1]
p numbers.length
p numbers.size
p numbers.reverse
p numbers.join("")
p numbers[0,3]
p numbers[0..4]
p numbers[0...4]
p numbers.include?(4)
p numbers.index(5)
p numbers.zip(details)

# Arrays Blocks and Iterations
puts ""
puts "Iterations:"

p numbers.find {|i| i%3 == 0}
p numbers.detect {|i| i%5 == 0}
p numbers.find_all {|i| i%3 == 0}
p numbers.select {|i| i%3 == 0}
p numbers.any? {|i| i%3 == 0}
p numbers.all? {|i| i%3 == 0}

p details.map {|name| name.upcase }
p details.collect {|name| name.upcase }
p details.map(&:capitalize)

p numbers.sort
p numbers.sort {|v1,v2| v2<=>v1}
p details.sort_by {|name| name.length}

p numbers.inject {|accumlator, value| accumlator+value}
p numbers.inject(0) {|a,v| a + v }
details << "some big value"
p details.inject {|a,v| v.length > a.length ? v : a }



values = [1, 2, 3, 4, 5]
p values
    .map{ |num| num * num }
    .select { |num| num.even? }
    .inject(&:+)