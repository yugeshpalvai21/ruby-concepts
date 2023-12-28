class Person
  # attr_reader :age
  # attr_writer :age
  attr_accessor :age
  
  def initialize(age: 0)
    @age = age
  end

  def is_major?
    age >= 18
  end

  def can_drink?  
    age >= 21
  end
end