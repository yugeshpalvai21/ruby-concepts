# Technically, blocks are not objects in ruby, but procs made blocks as objects

proc = Proc.new { puts 'Hello World' }
proc.call

#lets define method that handles proc

def method_cube
	yield(3)
end

cube = Proc.new {|number| number ** 3}
p method_cube(&cube)

# we can pass blocks as arguments with procs

def some_method(proc_param)
	puts 'start of line'
	proc_param.call
	puts 'end of line'
end
puts
proc = Proc.new { puts 'middle of the line' }
some_method(proc)


# lets play with array with procs

a = ['10', '20', '30', '40']
puts
p a.map {|element| element.to_i} 
p a.map(&:to_i) # here '&' tells proc defination