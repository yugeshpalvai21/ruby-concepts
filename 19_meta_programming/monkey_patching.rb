# monkey patching is programming technique that enables you
# to add/update/alter methods to existing builtin/custom classes

sample_sentence = "some sample text with random words"
p sample_sentence.respond_to?(:reverse_sentence)

class String
  def reverse_sentence
    self.split(' ').map(&:reverse).join(' ')
  end
end

p sample_sentence.respond_to?(:reverse_sentence)
p sample_sentence.reverse_sentence


# advantages  1. flexibility 2. good at small scale applications
# cautions    1. hard to maintain in legacy apps 2. ruby upgrage maintanence 3. developer understanding
# alternatives 1. use sub-class 2. decoratores 3. documentation 4. encapsulate in name spaced classes
