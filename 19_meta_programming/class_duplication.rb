# you can over-ride any existing class method behaviour by opening it again anywhere in the programm and modifying it 
class Person
  def first_name
    ""
  end
end

p Person.new.first_name

class Person
  def first_name
    "Yugesh"
  end
end

p Person.new.first_name

class Person
  def first_name
    "Y U G E S H"
  end
end

p Person.new.first_name
