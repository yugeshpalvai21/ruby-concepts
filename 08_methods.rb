# =============================================================================
# 08 - METHODS
# =============================================================================
# Methods bundle reusable behavior. The LAST expression is returned implicitly;
# use an explicit `return` only for early exits.
# =============================================================================

puts "--- Basic method & implicit return ---"
def square(n)
  n * n            # no `return` needed; this value comes back
end
p square(5) # => 25

puts "\n--- Endless method definition (Ruby 3.0+) ---"
def cube(n) = n ** 3
p cube(3) # => 27

puts "\n--- Default argument values ---"
def greet(name = "friend", greeting = "Hello")
  "#{greeting}, #{name}!"
end
p greet                      # => "Hello, friend!"
p greet("Yugesh")            # => "Hello, Yugesh!"
p greet("Yugesh", "Hi")      # => "Hi, Yugesh!"

puts "\n--- Keyword arguments (order-independent, self-documenting) ---"
def build_user(name:, role: "member", active: true)
  { name: name, role: role, active: active }
end
p build_user(name: "Yugesh")                 # role/active defaulted
p build_user(role: "admin", name: "Asha")    # order doesn't matter

puts "\n--- Splat (*) collects extra positional args into an array ---"
def total(*numbers)
  numbers.sum
end
p total(1, 2, 3, 4) # => 10
p total             # => 0

puts "\n--- Double splat (**) collects extra keyword args into a hash ---"
def tag(name, **attributes)
  attrs = attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
  "<#{name} #{attrs}>".squeeze(" ").sub(" >", ">")
end
p tag("a", href: "/home", class: "link") # => "<a href=\"/home\" class=\"link\">"

puts "\n--- Mixing it all: required, splat, keyword ---"
def full_name(first, *middles, last)
  [first, *middles, last].map(&:capitalize).join(" ")
end
p full_name("yugesh", "palvai")                 # => "Yugesh Palvai"
p full_name("john", "fitzgerald", "kennedy")    # => "John Fitzgerald Kennedy"

puts "\n--- Returning multiple values (really returns an array) ---"
def min_max(list)
  [list.min, list.max]
end
low, high = min_max([4, 9, 1, 7])
p [low, high] # => [1, 9]

puts "\n--- Blocks: yield & block_given? ---"
def with_logging
  puts "start"
  result = yield if block_given?
  puts "end"
  result
end
value = with_logging { 2 + 2 }
p value # => 4

puts "\n--- Capturing a block as an explicit proc (&block) ---"
def run_twice(&block)
  block.call
  block.call
end
run_twice { puts "tick" } # prints tick twice

puts "\n--- Argument forwarding with ... (Ruby 2.7+/3.0+) ---"
def log_and_call(...)
  puts "forwarding args"
  square(...)   # forwards every argument unchanged
end
p log_and_call(6) # => 36

# -----------------------------------------------------------------------------
# NOTE: method names can end in ? (predicates returning true/false) or !
# (bang: mutates or is the "dangerous" variant). This is convention, not syntax.
# -----------------------------------------------------------------------------
