# Practice Test 1

## 1. Classes and Objects

__Q: What is a class? What is an object? What relationship do they have? Explain with an example?__


__Q: When defining a class, we usually focus on state and behaviors. What is the difference between these two concepts?__

__Q: Given the below usage of the Person class, code the class definition__

```ruby
bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
```

__Q: Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now__
      Hint: let first_name and last_name be "states" and create an instance method called name that uses those states.

```ruby
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
```

## 2. Creating Setters and Getters

__Q: What is an accessor method?__

__Q: Explain how the element getter (reference) and setter methods work, and their corresponding syntactical sugar.__


__Q:We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?__

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.
```

## 3. Instance variables and Scope

__Q: What is an instance variable, and how is it related to an object?__

__Q:Why does this code not have the expected return value?__

```ruby
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end
end

ade = Student.new('Adewale')
ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
```

__Q: What is the scoping rule for instance variables?__


__Q: How does sub-classing affect instance variables?__



## 4. Class variables and scope
__Q: What is the purpose of a class variable?__

__Q: What are the scoping rules for class variables? What are the two main behaviors of class variables?__

__Q:What would the above code return, and why?__

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => ??

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => ??
Vehicle.wheels                              # => ??

class Car < Vehicle
end

Car.wheels                                  # => ??
```

## 5. Constants and scope

__Q: What is a constant variable?__

__Q: What are the scoping rules for constant variables?__

__Q: Describe the error and provide two different ways to fix it.__

```ruby
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires      
```

## 6. Instance methods vs Class methods
__Q: How can we expose information about the state of the object using instance methods?__

__Q: What is the difference between instance methods and class methods?__



## 7. Method Access Control
__Q: What is Method Access Control?__

__Q: # How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.__


## 8. Referencing and setting instance variables vs. using getters and setters

__Q: How do you decide whether to reference an instance variable or a getter method?__

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      
# => Sparky weighs 10 lbs and is 12 inches tall.
```


## 9. Class Inheritance

__Q: What is inheritance?__

__Q: When is it good to use inheritance?__

__Q: In inheritance, when would it be good to override a method?__

__Q: What will the following code output?__

```ruby
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak
```

__Q: Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.__

```ruby
class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + “Go #{speed} please!”
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
# Expected output:

# Ready to go! Drive fast, please!
```

## 10. Interface Inheritance and Modules

__Q: What is a module?__

__Q: What is a mixin?__

__Q: When creating a hierarchical structure, under what circumstance would a module be useful?__

__Q: What is interface inheritance, and under what circumstance would it be useful in comparison to class inheritance?__

__Q: What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?__

```ruby
module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk
```

## 11. Encapsulation

__Q: What is encapsulation, and why is it important in Ruby? Give an example.__


## 12. Polymorphism

__Q: What is polymorphism? Explain two different ways to implement polymorphism__

__Q: What is output and why? How does this code demonstrate polymorphism?__

```ruby
class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

```



## 13. Method Lookup Path

__Q: What is the method lookup path?__

__Q: How is the method lookup path affected by module mixins and class inheritance?__

__Q: What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.__

```ruby
module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
pingu.fly
```


## 14. `self` and calling methods with `self`

__Q: When would you call a method with `self`?__

__Q: On which lines in the following code does self refer to the instance of the MeMyselfAndI class referenced by i rather than the class itself? Select all that apply.__

```ruby
class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new
```
__Q:# In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix? Which use case would be preferred according to best practices in Ruby, and why?__

```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```


## 15. Fake Operators and Equality

__Q: How does equivalence work in Ruby?__

__Q: How do you determine if two variables actually point to the same object?__

__Q: What is == in Ruby? How does == know what value to use for comparison?__

__Q: Is it possible to compare two objects of different classes?__

__Q: If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?__

```ruby
class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new
```

__Q:How can you make this code function? How is this possible?__

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
End

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)
puts "bob is older than kim" if bob > kim
```

## 16. Collaborator Objects

__Q: What is a collaborator object, and what is the purpose of using collaborator objects in OOP?__

__Q:Identify all custom defined objects that act as collaborator objects within the code__

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)
```

__Q: We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?__

```ruby
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

bob.pets.jump 
```

## 17. Spike