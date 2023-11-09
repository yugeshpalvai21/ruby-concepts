class Person
  attr_accessor :name, :age, :location

  def custom_error_message method_name
    "It seems there is no method defined with #{method_name} on #{self.class}"
  end

  def method_missing(method_name, *arguments, &block)
    custom_error_message(method_name)
  end

end

person = Person.new
person.name = "yugesh palvai"
person.age = 29

p person.name
p person.location_first

p person.respond_to?(:name)
p person.respond_to?(:location_details)
