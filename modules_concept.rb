# module AB
#     module CD
#         EF = "SOME CONSTANT"
#         class Person
#             def initiallize
#                 @default_name = "Yugesh"
#             end
#         end
#     end
# end
# puts AB::CD::EF
# person = AB::CD::Person.new
# p person
# p person.class.ancestors


module Dummy
    def default_name
        "Yugesh Palvai"
    end
end

class Person
    prepend Dummy
    # include Dummy
    def default_name
        "Sachin Tendulkar"
    end

    def name
        @name || self.default_name
    end
end

person = Person.new
p person.name