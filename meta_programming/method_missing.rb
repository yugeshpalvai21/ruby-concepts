class Person
  attr_accessor :name, :age, :location

  def unknown_result
    "Not Able To Access"
  end

  def method_missing(method_name, *arguments, &block)
    if method_name =~ /location_(.*)/
      unknown_result
    else
      super
    end
  end
end

person = Person.new
person.name = "yugesh palvai"
person.age = 29

p person.name
# p person.courses
p person.location_first
p person.someother_method