# Practice Test 1

## Classes and Objects

__Q: What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?__

__Q: What is a class? What is an object? What relationship do they have? Explain with an example?__


__Q: What is Instantiation? Give an example.__


__Q: When defining a class, we usually focus on state and behaviors. What is the difference between these two concepts?__


__Q: How do you initialize a new object? Give an example?__

__Q: # What is the relationship between classes and objects in Ruby?__

__Q: What is a constructor method?__

__Q: What is the difference between classes and objects?__

__q: What is the default to_s method that comes with Ruby, and how do you override this?__

__Q: What are some important attributes of the to_s method?__

__Q: Explain the idea that a class groups behaviors.__

__Q: Objects do not share state between other objects, but do share behaviors__

__Q: The values in the objects' instance variables (states) are different, but they can call the same instance methods (behaviors) defined in the class.__

__Q: What is the difference between states and behaviors?__

__Q: Describe the distinction between modules and classes.__

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

__Q: Using the class definition from step #3, let's create a few more people -- that is, Person objects__
    If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

```ruby
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
```

__Q: Continuing with our Person class definition, what does the below print out?__

```ruby
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
```
__Q: Let's add a to_s method to the class. Now, what does the below output?__

```ruby
class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end
Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
```

__Q: What happens when you call the p method on an object? And the puts method?__

__Q: What is output on `lines 14, 15, and 16` and why?__

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name
```

__Q: # What is output and why? How could we output a message of our choice instead?__

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky
```

__Q: How is the output above different than the output of the code below, and why?__

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky
```

__Q: Do `molly` and `max` have the same states and behaviors in the code above? Explain why or why not, and what this demonstrates about objects in Ruby.__

```ruby
class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")
```


## Creating Setters and Getters

__Q: What is an accessor method?__

__Q: What is a getter method?__

__Q: What is attr_accessor?__

__Q: Explain how the element getter (reference) and setter methods work, and their corresponding syntactical sugar.__

__Q: When using getters and setters, in what scenario might you decide to only use a getter, and why is this important?__

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

__Q: In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?__

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name
```

__Q: # What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example.__

__Q: When might it make sense to format the data or prevent destructive method calls changing the data by using a custom getter or setter method?__


## Instance variables and Scope

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

__Q:# What is the return value, and why?__

```ruby
class Person
  def get_name
    @name                     # the @name instance variable is not initialized anywhere
  end
end

bob = Person.new
bob.get_name                  # => ??

```

__Q:What will this return, and why?__

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       
```

__Q: How do you get this code to return “swimming”? What does this demonstrate about instance variables?__

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim
```                         

__Q:What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?__

```ruby
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
```

__Q: What is output and why? What does this demonstrate about instance variables?__

```ruby
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim   
```
__Q:What does the above code demonstrate about how instance variables are scoped?__

```ruby
class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"
```
__Q: How do class inheritance and mixing in modules affect instance variable scope? Give an example.__

__Q:Running the following code will not produce the output shown on the last line. Why not? What would we need to change, and what does this demonstrate about instance variables?__

```ruby
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end 
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
```

__Q: What are the scopes of each of the different variables in the above code?__

```ruby
class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end
```


## Class variables and scope

__Q: What is the purpose of a class variable?__

__Q: What are the scoping rules for class variables? What are the two main behaviors of class variables?__

__Q: Are class variables accessible to sub-classes?__

__Q: Why is it recommended to avoid the use of class variables when working with inheritance?__

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

__Q: What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?__

```ruby
class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end
```


## Constants and scope

__Q: What is a constant variable?__

__Q: What are the scoping rules for constant variables?__

__Q: Is it possible to reference a constant defined in a different class?__

__Q: What is the namespace resolution operator?__

__Q: How are constants used in inheritance?__

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
__Q: What is lexical scope?__

__Q: When dealing with code that has modules and inheritance, where does constant resolution look first?__

__Q: What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?__

```ruby
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 
```


## Instance methods vs Class methods

__Q: What is an instance method?__

__Q: How can we expose information about the state of the object using instance methods?__

__Q: What are class methods?__

__Q: Classes also have behaviors not for objects (class methods).__

__Q: What is the difference between instance methods and class methods?__


## Method Access Control

__Q: What is Method Access Control?__

__Q: What is the private method call used for?__

__Q: What is the protected keyword used for?__

__Q: What are two rules of protected methods?__

__Q: # How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.__


## Referencing and setting instance variables vs. using getters and setters

__Q: How do you decide whether to reference an instance variable or a getter method?__


__Q: Why does the `.change_info` method not work as expected here?__

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

__Q: What code snippet can replace the "omitted code" comment to produce the indicated result?__

```ruby
class Person
  attr_writer :first_name, :last_name

  def full_name
    # omitted code
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
mike.full_name # => 'Michael Garcia'
```
__Q: The last line in the above code should return "A". Which method(s) can we add to the Student class so the code works as expected?__

```ruby
class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
priya.grade # => "A"
```

__Q: Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.__

__Q: Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`__

## Class Inheritance

__Q: What is inheritance?__

__Q: What is the difference between a superclass and a subclass?__

__Q: When is it good to use inheritance?__

__Q: In inheritance, when would it be good to override a method?__

__Q: What is inheritance, and why do we use it?__

__Q: Give an example of how to use class inheritance.__

__Q: Give an example of overriding. When would you use it?__

__Q: Give an example of using the super method. When would we use it?__

__Q: Give an example of using the super method with an argument.__

__Q: Why is it generally a bad idea to override methods from the Object class, and which method is commonly overridden?__

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


__Q: What change(s) do you need to make to the above code in order to get the expected output?__

```ruby
class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
sir_gallant.name # => "Sir Gallant"
sir_gallant.speak # => "Sir Gallant is speaking."
```

__Q:Make the changes necessary in order for this code to return the expected values.__

```ruby
class FarmAnimal
  def speak
    "#{self} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    "baaaaaaa!"
  end
end

class Cow
  def speak
    super + "mooooooo!"
  end
end

Sheep.new.speak # => "Sheep says baa!"
Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
Cow.new.speak # => "Cow says mooooooo!"
```

__Q: Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.__

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
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
__Q: When do you use empty parentheses with super?__


__Q: What is namespacing, and how do you instantiate a class contained in a module?__


__Q: What is output and why? What does this demonstrate about `super`?__

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno
```


## Interface Inheritance and Modules

__Q: What is a module?__

__Q: What is a mixin?__

__Q: When creating a hierarchical structure, under what circumstance would a module be useful?__

__Q: What is interface inheritance, and under what circumstance would it be useful in comparison to class inheritance?__

__Q: What is namespacing?__

__Q: How does Ruby provide the functionality of multiple inheritance?__

__Q: When should we use class inheritance vs. interface inheritance?__

__Q: Describe the use of modules as containers.__

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

__Q: What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?__

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
```
__Q: # What module/method could we add to the above code snippet to output the desired output on the last 2 lines, and why?__

```ruby
class House
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive
```

## Encapsulation

__Q: What is encapsulation?__

__Q: How does encapsulation relate to the public interface of a class?__

__Q: How do objects encapsulate state?__

__Q: Why should a class have as few public methods as possible?__

__Q: # What is encapsulation, and why is it important in Ruby? Give an example.__

## Polymorphism

__Q: What is polymorphism?__

__Q: Explain two different ways to implement polymorphism.__

__Q: How does polymorphism work in relation to the public interface?__

__Q: What is duck typing? How does it relate to polymorphism - what problem does it solve?__

__Q: The above code would work, but it is problematic. What is wrong with this code, and how can you fix it?__

```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Chef
        preparer.prepare_food(guests)
      when Decorator
        preparer.decorate_place(flowers)
      when Musician
        preparer.prepare_performance(songs)
      end
    end
  end
end

class Chef
  def prepare_food(guests)
    # implementation
  end
end

class Decorator
  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_performance(songs)
    #implementation
  end
end
```
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



## Method Lookup Path

__Q: What is the method lookup path?__

__Q: How is the method lookup path affected by module mixins and class inheritance?__

__Q:What is the method lookup path used when invoking `#walk` on `good_dog`?__

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


## `self` and calling methods with `self`

__Q: When would you call a method with `self`?__

__Q: From within a class, when an instance method uses self, what does it reference?__

__Q: What happens when you use self inside a class but outside of an instance method?__

__Q: Why do you need to use self when calling private setter methods?__

__Q: Why use self, and how does self change depending on the scope it is used in?__

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



__Q: What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.__

## Fake Operators and Equality

__Q: How does equivalence work in Ruby?__

__Q: How do you determine if two variables actually point to the same object?__

__Q: What is == in Ruby? How does == know what value to use for comparison?__

__Q: Is it possible to compare two objects of different classes?__

__Q:What will the code above return and why?__

```ruby
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => ??

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => ??

int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => ??
```
__Q: What is the `===` method?__

__Q: What is the eql? method?__

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

__Q: What happens here, and why?__

```ruby
my_hash = {a: 1, b: 2, c: 3}
my_hash << {d: 4}  

```

__Q: When do shift methods make the most sense?__

__Q: what is dream_team? What does the Team#+ method currently return? What is the problem with this? How could you fix this problem?__

```ruby
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    members + other_team.members
  end
end
# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
dream_team = cowboys + niners         
```

__Q:In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`?__

__Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?__


```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => # => true
```

__Q: What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?__

```ruby
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 
```
__Q: In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`? Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?__

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```
__Q: How and why would we implement a fake operator in a custom class? Give an example.__

__Q: What methods does this `case` statement use to determine which `when` clause is executed?__

```ruby
number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end
```


##  Collaborator Objects

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

__Q: What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.__


## Spike

__Q: What is a spike?__

__Q: When writing a program, what is a sign that you’re missing a class?__

__Q: What are some rules/guidelines when writing programs in OOP?__

__Q: # The following is a short description of an application that lets a customer place an order for a meal:__

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.
