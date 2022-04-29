module Walkable
  def walk
    "I am walking"
  end
end

module Swimmable
  def swim
    "I am swimming"
  end
end

module Climbable
  def climb
    "I am climbing"
  end
end

class Animal
  include Walkable

  def speak
    "I am an animal, and I speak!"
  end
end

class GoodDog < Animal
  include Swimmable
  include Climbable
end

fido = Animal.new

puts GoodDog.ancestors
