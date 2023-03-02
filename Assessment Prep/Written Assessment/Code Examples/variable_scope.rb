# Instance Variables

# class Human
#   def initialize(name)
#     @name = name
#   end

#   def change_name
#     @name += " Doe"
#   end
# end

# bob = Human.new("Bob")
# joe = Human.new("Joe")

# p bob
# p joe

# bob.change_name
# p bob
# p joe

# Instance variables are scoped at the object level which is
# they are used to track individual object state.
# They donot crossover between object
# Because they are scoped at the object level they are accessible
# inside an object's instance methods even if it is initialized
# outside the instance method.

# Class Variables

# class Person
#   @@greeting = "Hello"

#   def self.greet
#     @@greeting
#   end

#   def greet
#     @@greeting
#   end

#   def add_to_greeting
#     @@greeting += " World"
#   end
# end

# bob = Person.new
# joe = Person.new

# p Person.greet
# p bob.greet
# p joe.greet
# bob.add_to_greeting
# joe.add_to_greeting
# p Person.greet

# Constants

# class Person
#   FAV_FRUITS = %W(apple orange avocado)

#   def self.fav_fruits
#     FAV_FRUITS
#   end

#   def eat
#     "I am eating an #{FAV_FRUITS.sample}"
#   end
# end

# bob = Person.new
# p Person.fav_fruits
# p bob.eat

# module SchoolStaff
#   FAV_FRUITS = %W(apple orange avocado)

#   class Person
#     def self.fav_fruits
#       FAV_FRUITS
#     end
  
#     def eat
#       "I am eating an #{FAV_FRUITS.sample}"
#     end
#   end
# end

# bob = SchoolStaff::Person.new
# p bob.eat
# p SchoolStaff::Person.fav_fruits

class Robot
  GREETINGS = %w(hello hi)
end

class Person
  def self.greetings
    GREETINGS
  end

  def greet
    GREETINGS.sample
  end
end

bob = Person.new
p bob.greet
p Person.greetings
