# =============================================================================
# 19g - MONKEY PATCHING
# =============================================================================
# Monkey patching = reopening a class (often a built-in) to add or change
# methods at runtime. Handy, but it changes behavior GLOBALLY for everyone.
# =============================================================================

sentence = "some sample text with random words"

puts "--- Before: the method doesn't exist ---"
p sentence.respond_to?(:reverse_each_word) # => false

# Monkey patch: add a method to the core String class.
class String
  def reverse_each_word
    split(" ").map(&:reverse).join(" ")
  end
end

puts "\n--- After: every String now has it ---"
p sentence.respond_to?(:reverse_each_word) # => true
p sentence.reverse_each_word
# => "emos elpmas txet htiw modnar sdrow"

puts "\n--- Trade-offs ---"
puts <<~NOTES
  PROS:
    - flexible, quick to add behavior
    - fine for small apps / scripts
  CONS:
    - global: can clash with gems or future Ruby versions
    - hard to trace ("where did this method come from?")
    - risky across upgrades
  SAFER ALTERNATIVES:
    - subclass or wrap/decorate the object
    - use a module + refinements (scoped, see core_class_enhance.rb)
    - put helpers in a namespaced module instead of patching built-ins
NOTES
