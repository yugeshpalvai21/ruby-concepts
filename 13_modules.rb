# =============================================================================
# 13 - MODULES
# =============================================================================
# Modules do two jobs:
#   1. NAMESPACE   -> group related constants/classes to avoid name clashes
#   2. MIXIN       -> share behavior across unrelated classes
#      include  -> adds methods as INSTANCE methods
#      extend   -> adds methods as CLASS (or singleton) methods
#      prepend  -> like include, but inserts BEFORE the class so it can wrap
#                  the class's own methods via super
# =============================================================================

puts "--- 1) Modules as namespaces ---"
module Football
  class Player
    attr_reader :name, :country

    def initialize(name, country)
      @name = name
      @country = country   # (the original dropped this; fixed here)
    end
  end
end

# A separate, unrelated top-level Player
class Player
  attr_reader :name
  def initialize(name) = @name = name
end

messi = Football::Player.new("Messi", "ARG")
roger = Player.new("Roger")
p messi.class    # => Football::Player
p roger.class    # => Player
p messi.country  # => "ARG"

puts "\n--- 2a) include -> instance methods ---"
module Greetable
  def greet = "Hi, I'm #{name}"
end

class Teacher
  include Greetable           # greet becomes an instance method
  attr_reader :name
  def initialize(name) = @name = name
end

p Teacher.new("Yugesh").greet # => "Hi, I'm Yugesh"
p Teacher.ancestors.take(3)   # => [Teacher, Greetable, Object]

puts "\n--- 2b) extend -> class/singleton methods ---"
module Countable
  def count_label(n) = "#{n} item(s)"
end

class Cart
  extend Countable            # count_label becomes a CLASS method
end
p Cart.count_label(3)         # => "3 item(s)"

# extend also works on a single object:
plain = Object.new
plain.extend(Greetable)
def plain.name = "Solo"
p plain.greet                 # => "Hi, I'm Solo"

puts "\n--- 2c) prepend -> wrap existing methods via super ---"
module Audited
  def save
    puts "[audit] before save"
    super                     # calls the class's own #save
  end
end

class Document
  prepend Audited             # Audited sits BEFORE Document in the chain
  def save = puts "saving document"
end

Document.new.save
# [audit] before save
# saving document
p Document.ancestors.take(3)  # => [Audited, Document, Object]

puts "\n--- Module constants & the included hook ---"
module Config
  VERSION = "1.0"

  # self.included fires when a class does `include Config`
  def self.included(base)
    puts "Config was mixed into #{base}"
  end

  def config_version = VERSION
end

class App
  include Config              # triggers the hook above
end
p App.new.config_version      # => "1.0"
p Config::VERSION             # => "1.0"

# -----------------------------------------------------------------------------
# NOTE: Comparable and Enumerable are the canonical built-in mixins. Define
# `<=>` and `include Comparable` to get <, >, ==, between?, clamp for free.
# -----------------------------------------------------------------------------
puts "\n--- Comparable mixin example ---"
class Version
  include Comparable
  attr_reader :number
  def initialize(number) = @number = number
  def <=>(other) = number <=> other.number
end
p Version.new(2) > Version.new(1)              # => true
p [Version.new(3), Version.new(1)].min.number  # => 1
