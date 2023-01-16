module Walkable
  def walk
    puts "Lets go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi, I am #{name}"
  end
end

kitty = Cat.new("Kitty")
kitty.greet
kitty.name = "Luna"
kitty.greet

kitty.walk
# A new object of a class can be instantiated by invoking the class method
# `new` on the class `Cat`. The `new` method inherited by `Cat` from the `BasicObject`
# class returns a new object of the class it is invoked upon. In this case on line 4 it returns 
# a new object of class `Cat` which is then assigned to the local variable `kitty`

# The `initialize` instance method is triggered and invoked by the the class method
# `new`. It is called a constructor method because it is usually used to ``'build' the
# object by instantiating it with a state. State refers to the data or information associated
# to each individual object. And state is instantiated by initializing instance variables and 
# assigning them with some values.

# We can pass arguments to this `initialize` method by passing them to the `new` method which
# passes them on to the `initialize` method. The arguments passed to the `initialize` method upon object
# instantiation can be used to initialize the object with a state by initializing instance variables to these
# arguments. Instance variables are scoped at the object level are available for referencing anywhere iuside
# the object's instance methods and they exist as long as the object instance exists.

# Getter methods are used to access an object's instance variables, specifically to retrieve the value 
# for an instance variable. Getter methods are instance methods, hence can only be invoked on an instance.
