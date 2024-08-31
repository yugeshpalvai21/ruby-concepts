#Small Number
p 12.class

#Big Number
p 12112112112112112121212112.class 

#Decimal Number
p 12.34.class

#methods available on Integer
number = 12
float_number = 12.34
p number.methods.count #count of both class and instance methods
p number.class.methods.count #count of class methods only
p number.methods - number.class.methods #gives array of object methods

p float_number.methods.count #count of both class and instance methods
p float_number.class.methods.count #count of class methods only
p float_number.methods - float_number.class.methods



#most used methods with numbers

p number.next
p number.to_s
p number.even?
p number.odd?
p number.chr
p 12.12.round(1)
p -13.abs

#Blocks and Iterations with Numbers

number.times{|i| puts "Hello World"}
number.upto(20){|i| puts i}
number.downto(1){|i| puts i*i}
