class Person
  attr_reader :age

  def initialize(age: 0)
    @age = age
  end

  def is_major?
    age >= 18
  end
end