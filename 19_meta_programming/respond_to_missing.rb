class Person
  attr_accessor :name, :age, :location

  def unknown_result
    "Not Able To Access"
  end

  def method_missing(method_name, *arguments, &block)
    if method_name =~ /location_(.*)/  #pattern matching
      unknown_result
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?("location_") || super
  end
end

person = Person.new

p person.respond_to?(:name)
p person.respond_to?(:location_first) # this method is not defined and will called on the fly through method missing
p person.location_first
