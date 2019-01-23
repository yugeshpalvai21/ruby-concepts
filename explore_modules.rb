# modules as Namespaces
module FootBall
	class Player
		attr_reader :name, :country
		
		def initialize(name, country)
			@name = name
		end
	end
end

class Player
	attr_reader :name

	def initialize(name)
		@name = name
	end
end

football_player = FootBall::Player.new('messi','arg')
tennis_player = Player.new('roger')

p football_player.name
p tennis_player.name

p football_player.class
p tennis_player.class


#modules as mixins

module Info
	ORGANIZATION = "GIST"
	attr_accessor :first_name, :last_name,  :location
	def initialize(first_name, last_name, location)
		@first_name = first_name
		@last_name = last_name
		@location = location
	end
	def details
		"#{first_name} #{last_name} - #{location}"
	end
end

class Teacher
	include Info  #extend keyword used to access module methods as class methods
end

class Student
	include Info  #prepend keyword used to override local methods with module methods
end


teacher = Teacher.new('yugesh', 'palvai', 'ind')
student = Student.new('john', 'doe', 'usa')

p teacher.details
p student.details

p Info::ORGANIZATION