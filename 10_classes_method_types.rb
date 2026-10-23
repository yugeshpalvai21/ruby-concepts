# =============================================================================
# 10 - METHOD VISIBILITY: public, private, protected
# =============================================================================
# public    -> callable by anyone (the default)
# private   -> callable only within the object itself, WITHOUT an explicit
#              receiver (can't do other_obj.method)
# protected -> callable within the class, including on OTHER instances of the
#              same class (self.method AND other.method both work)
# =============================================================================

class Customer
  attr_reader :first_name, :last_name, :location

  def initialize(first_name:, last_name:, location:, rank:)
    @first_name = first_name
    @last_name  = last_name
    @location   = location
    @rank       = rank
  end

  # PUBLIC: the object's interface. `greets` relies on a private helper.
  def greets
    "Hello #{full_name}, you're from #{location}"
  end

  # PROTECTED lets us compare two customers by reading the OTHER one's rank.
  def higher_ranked_than?(other_customer)
    rank > other_customer.rank   # allowed: both are Customers
  end

  private

  # PRIVATE: an internal helper. Callable only as a bare `full_name`,
  # never as `customer.full_name` from outside.
  def full_name
    "#{first_name} #{last_name}"
  end

  protected

  # PROTECTED reader used for peer comparison above.
  def rank
    @rank
  end
end

alice = Customer.new(first_name: "Alice", last_name: "Lee", location: "IND", rank: 101)
bob   = Customer.new(first_name: "Bob",   last_name: "Ray", location: "USA", rank: 88)

puts "--- public method works ---"
puts alice.greets # => Hello Alice Lee, you're from IND

puts "\n--- protected enables peer comparison ---"
p alice.higher_ranked_than?(bob) # => true
p bob.higher_ranked_than?(alice) # => false

puts "\n--- private & protected raise when called from outside ---"
begin
  alice.full_name
rescue NoMethodError => e
  puts "full_name is private -> #{e.message.split(" for ").first}"
end

begin
  alice.rank
rescue NoMethodError => e
  puts "rank is protected -> #{e.message.split(" for ").first}"
end

puts "\n--- You can also mark visibility by name, after defining ---"
class Vault
  def open = "opened with #{secret}"
  def secret = "1234"
  private :secret   # make an already-defined method private
end
p Vault.new.open # => "opened with 1234"
begin
  Vault.new.secret
rescue NoMethodError
  puts "secret is private"
end
