#Before Discussing lambdas, first w'll see pitfalls in procs

proc = Proc.new {|a,b| a*b}
#p proc.call(2)        # it sends ungiven arguments as nil
p proc.call(2,3)       #it process the request
p proc.call(2,3,4)     #it process request, and ignore extra arguments

#now let's deal above scenario with lambdas
puts 
lamb = lambda {|a,b| a*b }
#lamb.call(4)         #it gives error message, wrong number of arguments
p lamb.call(4,5) 
#lamb.call(4,5,6)     #it gives error message, wrong number of arguments 

# Here we discuss another pitfall
puts 
def some_method_name
	proc = Proc.new { return 'middle value'}
	proc.call  # it stops execution of method and returns value
	return 'end value'
end
p some_method_name

def another_method
	lamb = -> { return 'middle value'} # you can use 'lambda' keyword instead of '->' symbol to define lambda
	lamb.call #it won't stop execution of method
	return 'end value'
end

p another_method