class Dog
	def initialize(hunger_level = 0)
		@hunger_level = hunger_level
	end

	def bark
		"bow"
	end

	def hungry?
		@hunger_level > 5
	end

	def feed
		@hunger_level = 0
	end
end