class User
	@@organization = "mit"
	attr_accessor :id, :name, :location

	def initialize(id=101,name='yugesh',location='ind')
		@id = id
		@name = name
		@location = location
	end

	def self.organization
		@@organization
	end

	def full_details
		# "#{@id}: #{@name.capitalize} - #{@@organization} - #{@location.upcase}"
		# "#{self.id}: #{self.name.capitalize} - #{self.class.organization} - #{self.location.upcase}"
		"#{id}: #{name.capitalize} - #{self.class.organization} - #{location.upcase}"	
	end	
end
puts User.organization

user1 = User.new
puts user1.full_details
#puts user1.organization

user2 = User.new(102, 'John', 'usa')
puts user2.full_details