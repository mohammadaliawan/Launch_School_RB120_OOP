# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts "#{@name} says Arf!!"
#   end

#   def get_name
#     @name
#   end
# end

# sparky = GoodDog.new("Sparky")
# fido = GoodDog.new("Fido")

# # sparky.speak
# # fido.speak

# # p sparky.get_name
# p fido.get_name

class Person
  attr_reader :name

  def name=(name)
    self.name = name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name