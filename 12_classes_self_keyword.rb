# =============================================================================
# 12 - THE `self` KEYWORD
# =============================================================================
# `self` is "the current object". What it refers to depends on context:
#   - inside an instance method  -> the instance
#   - inside the class body       -> the class itself
#   - `def self.foo`              -> defines a CLASS (singleton) method
# =============================================================================

class User
  # Class-level state via a class instance variable (not @@).
  @organization = "mit"

  # --- Class methods: three equivalent ways ---
  def self.organization        # (1) def self.x
    @organization
  end

  class << self                # (2) reopen the singleton class for a block of them
    def company = "Acme Inc."
  end

  attr_accessor :id, :name, :location

  def initialize(id: 101, name: "yugesh", location: "ind")
    @id = id
    @name = name
    @location = location
  end

  # Inside an instance method, `self` is the instance.
  def full_details
    # self.class reaches the class to call the class method `organization`
    "#{id}: #{name.capitalize} - #{self.class.organization} - #{location.upcase}"
  end

  # `self.` is REQUIRED when calling a setter, otherwise Ruby thinks you're
  # creating a local variable.
  def rename(new_name)
    self.name = new_name   # calls the name= setter (not a local assignment)
    self                   # returning self enables method chaining
  end
end

# (3) define_singleton_method also adds a class method dynamically
User.define_singleton_method(:version) { "1.0" }

puts "--- Class methods (self receiver is the class) ---"
p User.organization # => "mit"
p User.company      # => "Acme Inc."
p User.version      # => "1.0"

puts "\n--- Instance methods (self is the instance) ---"
user = User.new
puts user.full_details # => 101: Yugesh - mit - IND

user2 = User.new(id: 102, name: "john", location: "usa")
puts user2.full_details # => 102: John - mit - USA

puts "\n--- Returning self enables chaining ---"
puts User.new.rename("asha").rename("bhavna").full_details
# => 101: Bhavna - mit - IND

puts "\n--- self inside the class body is the class ---"
class Demo
  p self          # => Demo (the class object, printed at load time)
  THIS = self
end
p Demo::THIS == Demo # => true
