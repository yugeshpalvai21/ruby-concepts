# Person Class 
class Person
	@@organization = "NSWT"  #class variable
	attr_accessor :first_name, :last_name
	def initialize(first_name, last_name)
		@first_name = first_name
		@last_name = last_name
	end

	def full_name
		"#{first_name.capitalize} #{last_name.capitalize}"
	end

	def self.organization  #class method
		@@organization
	end
end


# Student Class inherits from Person Class

class Student < Person  
	def initialize(first_name, last_name)
		super #call parent initialze method with sending same params that it received
	end

	def info
		"Mr. #{full_name} is a student from #{self.class.organization}"
	end
end

# Teacher class inherits from Person Class

class Teacher < Person
	def initialize(first_name, last_name, specialization)
		super(first_name, last_name) #call parent initialze method with sending required params that it needed
		@specialization = specialization
	end

	def info
		"Mr. #{full_name} is a teacher from #{self.class.organization}"
	end
end

#student object
student = Student.new('john', 'doe')
p student.class
p student.class.superclass
p student.class.ancestors
p student.is_a?(Student)
p student.instance_of?(Student)
p student.full_name
p Student.organization
p student.info

# teacher object
puts ""
teacher = Teacher.new('yugesh', 'palvai', 'computers')
p Teacher.organization
p teacher.class.ancestors
p teacher.is_a?(Person)
p teacher.instance_of?(Person)
p teacher.full_name
p teacher.info