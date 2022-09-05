# Modules

**Question:**

> What is the method lookup path used when invoking `#walk` on `good_dog`?

```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end
  
  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk
```

**Answer**

The method lookup for any method invoked on an object of `GoodAnimals::GoodDog` class will be the same. We check the methodlookup path by calling the class method `ancestors` on the `GoodAnimals::GoodDog` class. So the method lookup path for objects of `GoodAnimals::GoodDog` is `[GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable, Object, Kernel, BasicObject].`

This code demonstrates how ruby traverses the method lookup path whenever a method is invoked. The method lookup path is the order in which classes and included modules are traversed and searched for the definition of the invoked method. When Ruby find a definition for the method it stops looking any further.

**Question:**

```ruby
module Drivable
  def self.drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?
```

**Answer**

