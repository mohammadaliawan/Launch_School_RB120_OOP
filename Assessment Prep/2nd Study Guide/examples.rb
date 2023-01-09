# class Animal
#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def older_than?(other_animal)
#     self.human_years > other_animal.human_years
#   end

#   protected

#   def human_years
#     age * self.class::ANIMAL_YEARS
#   end
# end

# class GoodDog < Animal
#   ANIMAL_YEARS = 7

#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end
# end

# sparky = GoodDog.new("sparky", 4)
# fido = GoodDog.new("fido", 3)

# sparky.human_years
# p sparky.older_than?(fido)

# class SomeClass
#   def self.some_class_method
#     puts self
#   end
# end

# SomeClass.some_class_method

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Bulldog
  def speak
    p "Dog Speaking!!"
  end
end

class Cat
  def speak
    p "Cat Speaking!!"
  end
end

bob = Person.new("Robert")

bud = Bulldog.new

kitty = Cat.new

bob.pets << bud << kitty

bob.pets.each do |pet|
  pet.speak
end