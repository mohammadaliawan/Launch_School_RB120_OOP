module Flyable
  def fly
    "I am flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new("Red")
p bird1.color

# [Bird, Flyable, Animal]