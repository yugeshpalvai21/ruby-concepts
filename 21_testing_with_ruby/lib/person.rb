# A tiny domain object with age-based predicates.
class Person
  attr_accessor :age

  def initialize(age: 0)
    @age = age
  end

  def major?      = age >= 18
  def can_drink?  = age >= 21

  # A method with a side effect / collaborator, used to demo mocks in the spec.
  def notify(messenger)
    messenger.deliver("Happy birthday! You are #{age}.")
  end
end
