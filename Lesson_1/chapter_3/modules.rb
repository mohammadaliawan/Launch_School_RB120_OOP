module Swimmable
  def swim
    "I am swimming"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end

sparky = Dog.new
neemo = Fish.new
paws = Cat.new

sparky.swim
neemo.swim
paws.swim
