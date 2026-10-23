# =============================================================================
# 02 - STRINGS
# =============================================================================
# Strings hold text. Ruby ships a huge, expressive String API.
# Reference: https://docs.ruby-lang.org/en/master/String.html
# =============================================================================

puts "--- Creating strings ---"
a = "double quoted"          # supports interpolation + escapes
b = 'single quoted'          # literal, no interpolation
c = String.new("explicit")   # via the class
d = <<~HEREDOC                # squiggly heredoc strips leading indentation
  multi-line
  text block
HEREDOC
p [a, b, c]
puts d

puts "\n--- Interpolation & escapes ---"
name = "yugesh"
puts "Hello, #{name.capitalize}!"   # => Hello, Yugesh!
puts "Tab\there, newline below\ndone"

puts "\n--- Transforming (these return NEW strings) ---"
s = "the quick brown fox"
p s.upcase          # => "THE QUICK BROWN FOX"
p s.capitalize      # => "The quick brown fox"
p s.swapcase        # => "THE QUICK BROWN FOX" -> swaps each char's case
p s.reverse         # => "xof nworb kciuq eht"
p s.split(" ")      # => ["the", "quick", "brown", "fox"]
p s.tr("aeiou", "*") # => "th* q**ck br*wn f*x"
p "  padded  ".strip # => "padded"
p "hello".center(11, "*") # => "***hello***"

puts "\n--- Length, indexing, slicing ---"
p s.length          # => 19
p s[0]              # => "t"
p s[-1]             # => "x"
p s[0, 3]           # => "the"   (start, length)
p s[4..8]           # => "quick" (range)
p s[/b\w+/]         # => "brown" (first regex match)

puts "\n--- Predicate (?) methods ---"
p s.include?("quick") # => true
p s.start_with?("the") # => true
p s.end_with?("fox")   # => true
p "".empty?            # => true
p "Yugesh123".match?(/\d/) # => true  (prefer match? for a boolean, it's fast)

puts "\n--- Searching & replacing ---"
p s.index("quick")           # => 4
p s.count("o")               # => 2
p s.gsub("o", "0")           # => "the quick br0wn f0x" (all)
p s.sub("o", "0")            # => "the quick br0wn fox" (first only)
p s.gsub(/(\w+)/) { |w| w.capitalize } # title-case via block

puts "\n--- Iterating ---"
"abc".each_char { |ch| print ch.upcase } # => ABC
puts
p "a,b,c".chars              # => ["a", "b", "c"]
p "line1\nline2".each_line.to_a # => ["line1\n", "line2"]

puts "\n--- Building strings ---"
parts = []
parts << "foo"               # << appends (mutates when string is mutable)
parts << "bar"
p parts.join("-")            # => "foo-bar"
p format("%-6s|%05d", "id", 42) # => "id    |00042"  (printf-style)
p "%d apples, %.1f kg" % [3, 1.25] # => "3 apples, 1.2 kg"

puts "\n--- Conversions ---"
p "42".to_i        # => 42
p "3.14".to_f      # => 3.14
p "ruby".to_sym    # => :ruby
p 42.to_s          # => "42"
p 255.to_s(16)     # => "ff" (base 16)

# -----------------------------------------------------------------------------
# NOTE: methods ending in `!` (upcase!, strip!, gsub!) mutate the receiver in
# place and return nil if no change was made. Prefer the non-bang versions
# unless you specifically need to mutate.
# -----------------------------------------------------------------------------
