# =============================================================================
# 03 - NUMBERS
# =============================================================================
# Ruby numbers: Integer (arbitrary precision), Float, Rational, Complex.
# =============================================================================

puts "--- Numeric classes ---"
p 12.class                              # => Integer
p 12_000_000_000_000_000_000_000.class  # => Integer (underscores are just readability)
p 12.34.class                           # => Float
p (3/4r).class                          # => Rational
p (2 + 1i).class                        # => Complex

puts "\n--- Arithmetic ---"
p 7 + 3      # => 10
p 7 - 3      # => 4
p 7 * 3      # => 21
p 7 / 3      # => 2   (integer division truncates!)
p 7.0 / 3    # => 2.3333333333333335 (float division)
p 7 % 3      # => 1   (modulo / remainder)
p 7 ** 3     # => 343 (exponent)
p 7.fdiv(3)  # => 2.3333333333333335 (always float division)
p 7.divmod(3) # => [2, 1] (quotient and remainder together)

puts "\n--- Rounding family ---"
p 3.14159.round(2) # => 3.14
p 3.14159.ceil(2)  # => 3.15 (round up)
p 3.14159.floor(2) # => 3.14 (round down)
p 3.7.round        # => 4
p 3.7.to_i         # => 3   (truncates toward zero)
p (-13).abs        # => 13

puts "\n--- Handy predicates & helpers ---"
p 12.even?   # => true
p 12.odd?    # => false
p 0.zero?    # => true
p 5.positive? # => true
p (-5).negative? # => true
p 5.between?(1, 10) # => true
p 5.clamp(1, 3)     # => 3   (clamp into a range)
p 12.gcd(18)        # => 6
p 12.lcm(18)        # => 36

puts "\n--- Conversions & bases ---"
p 42.to_s       # => "42"
p 255.to_s(2)   # => "11111111" (binary)
p 255.to_s(16)  # => "ff"       (hex)
p "ff".to_i(16) # => 255
p 65.chr        # => "A" (ASCII)

puts "\n--- Floats need care: use Rational or round for money ---"
p 0.1 + 0.2             # => 0.30000000000000004 (binary float imprecision)
p (0.1 + 0.2).round(2)  # => 0.3
p (1r/10 + 2r/10)       # => (3/10) exact with Rational

puts "\n--- Iteration with numbers ---"
3.times { |i| print "#{i} " }   # => 0 1 2
puts
1.upto(5) { |i| print "#{i} " } # => 1 2 3 4 5
puts
5.downto(1) { |i| print "#{i} " } # => 5 4 3 2 1
puts
0.step(10, 2) { |i| print "#{i} " } # => 0 2 4 6 8 10
puts
p (1..5).sum                    # => 15
p (1..5).reduce(:*)             # => 120 (factorial of 5)

puts "\n--- Randomness ---"
srand(42) # seed so output is reproducible for this demo
p rand(100)       # random Integer 0..99
p rand(1.0)       # random Float 0.0..1.0
p [1, 2, 3].sample # random element
