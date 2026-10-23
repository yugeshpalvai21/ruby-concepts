# =============================================================================
# 11 - INHERITANCE
# =============================================================================
# A subclass (`<`) inherits behavior from its superclass and can add to or
# override it. `super` calls the parent's version of the current method.
# =============================================================================

class Person
  # Prefer a CLASS INSTANCE VARIABLE (@ on the class) over @@class variables.
  # @@vars are shared across the whole hierarchy and can be surprising;
  # a class instance variable + a reader is cleaner and subclass-friendly.
  @organization = "NSWT"

  class << self
    attr_accessor :organization   # Person.organization reader/writer
  end

  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def describe
    "#{full_name} from #{self.class.organization}"
  end
end

# -- Student only reuses Person's behavior, so no initialize override needed. --
class Student < Person
  def describe
    "Student #{super}"   # `super` (no args) reuses Person#describe's result
  end
end

# -- Teacher adds state, so it overrides initialize and calls super explicitly --
class Teacher < Person
  attr_reader :specialization

  def initialize(first_name, last_name, specialization)
    super(first_name, last_name)   # pass only what the parent expects
    @specialization = specialization
  end

  def describe
    "Teacher #{super} specializing in #{specialization}"
  end
end

puts "--- Student ---"
student = Student.new("john", "doe")
p student.class              # => Student
p student.class.superclass   # => Person
p Student.ancestors          # => [Student, Person, Object, Kernel, BasicObject]
p student.is_a?(Person)      # => true  (Student IS-A Person)
p student.instance_of?(Person) # => false (its exact class is Student)
puts student.describe        # => Student john doe from NSWT

puts "\n--- Teacher ---"
teacher = Teacher.new("yugesh", "palvai", "computers")
puts teacher.describe        # => Teacher yugesh palvai from NSWT specializing in computers

puts "\n--- Subclasses can have their own org value ---"
Student.organization = "MIT"      # overrides the inherited class-instance var
p Student.organization            # => "MIT"
p Teacher.organization            # => "NSWT" (independent, unaffected)
p Person.organization             # => "NSWT"

# -----------------------------------------------------------------------------
# super cheat-sheet:
#   super        -> call parent method, forwarding the SAME arguments
#   super(a, b)  -> call parent method with EXPLICIT arguments
#   super()      -> call parent method with NO arguments
# -----------------------------------------------------------------------------
