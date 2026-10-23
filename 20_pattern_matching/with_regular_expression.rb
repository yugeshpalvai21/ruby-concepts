# =============================================================================
# 20b - REGULAR EXPRESSIONS
# =============================================================================
# Regexes describe text patterns. Ruby has first-class regex support with
# /slashes/. (Grouped here under "pattern matching" as the text-matching
# counterpart to case/in structural matching.)
# =============================================================================

text = "Hello, World! Order #12345 for user@example.com"

puts "--- Boolean match: match? (fastest, no side effects) ---"
p text.match?(/World/)     # => true
p text.match?(/goodbye/)   # => false

puts "\n--- =~ returns the index of the first match (or nil) ---"
p(text =~ /World/)         # => 7
p(text =~ /nope/)          # => nil
# Because nil is falsy, =~ reads naturally in a condition:
puts "has a number" if text =~ /\d+/

puts "\n--- MatchData & capture groups via #match ---"
m = text.match(/Order #(\d+)/)
p m[0] # => "Order #12345" (whole match)
p m[1] # => "12345"        (first capture group)

puts "\n--- Named captures ---"
if (m = text.match(/#(?<order_id>\d+)/))
  p m[:order_id] # => "12345"
end
# Named captures also assign locals when a /literal regex/ is on the LEFT of =~:
if /user@(?<domain>[\w.]+)/ =~ text
  p domain # => "example.com"
end

puts "\n--- scan: every match ---"
p "a1 b2 c3".scan(/\d/)             # => ["1", "2", "3"]
p "a1 b2 c3".scan(/([a-z])(\d)/)   # => [["a","1"], ["b","2"], ["c","3"]]

puts "\n--- gsub with backreferences and blocks ---"
p "2024-01-31".gsub(/(\d+)-(\d+)-(\d+)/, '\3/\2/\1') # => "31/01/2024"
p "hello world".gsub(/\b\w/) { |ch| ch.upcase }      # => "Hello World"

puts "\n--- split by a pattern ---"
p "a, b ,c ,  d".split(/\s*,\s*/) # => ["a", "b", "c", "d"]

puts "\n--- Common anchors & classes cheat-sheet ---"
# \A start of string   \z end of string   ^ $ start/end of line
# \d digit  \w word char  \s whitespace   . any char   i flag = case-insensitive
p "RUBY".match?(/\Aruby\z/i) # => true
p "  spaced  ".match?(/\A\s+/)  # => true

puts "\n--- Validating with a regex (simple email shape) ---"
EMAIL = /\A[\w.+-]+@[\w-]+\.[\w.-]+\z/
%w[a@b.com nope @bad.com].each do |candidate|
  puts "#{candidate.ljust(10)} valid? #{candidate.match?(EMAIL)}"
end
